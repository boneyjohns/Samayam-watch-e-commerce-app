import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/functions/wishlist_fun.dart';
import 'package:samayam/model/product_model.dart';

class Favorateicon extends StatelessWidget {
  const Favorateicon(
      {super.key, required this.documentSnapshot, required this.index});

  final List<ProductModel> documentSnapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 20,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentemail)
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
                              (item) =>
                                  item.name == documentSnapshot[index].name,
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
                              (item) =>
                                  item.name == documentSnapshot[index].name,
                            )
                            .isNotEmpty
                        ? await removefromwislist(
                            doc: documentSnapshot[index].name)
                        : await addtowhishlist(
                            product: documentSnapshot[index]);
                  },
                );
              } else {
                return const SizedBox();
              }
            }));
  }
}
