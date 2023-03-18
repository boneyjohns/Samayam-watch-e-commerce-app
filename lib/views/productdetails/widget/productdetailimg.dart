import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/functions/wishlist_fun.dart';
import 'package:samayam/model/product_model.dart';

class Productdetailimg extends StatelessWidget {
  const Productdetailimg({
    Key? key,
    required this.product,
    required this.image,
  }) : super(key: key);
  final List image;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image[0].toString()), fit: BoxFit.fill)),
        ),
        Positioned(
            right: 20,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('wishlist')
                    .snapshots()
                    .map((snapshot) => snapshot.docs
                        .map((e) => ProductModel.fromJson(e.data()))
                        .toList()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final wishlist = snapshot.data;
                    return IconButton(
                      icon: Icon(
                        wishlist!
                                .where(
                                  (item) => item.name == product.name,
                                )
                                .isEmpty
                            ? Icons.favorite_outline_rounded
                            : Icons.favorite,
                        size: 30,
                        color: kred,
                      ),
                      onPressed: () async {
                        wishlist
                                .where(
                                  (item) => item.name == product.name,
                                )
                                .isNotEmpty
                            ? await removefromwislist(doc: product.name)
                            : await addtowhishlist(product: product);
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }))
      ],
    );
  }
}
