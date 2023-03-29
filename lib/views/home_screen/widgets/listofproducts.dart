import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/functions/wishlist_fun.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/productdetails/productdetails.dart';

class Listofproducts extends StatelessWidget {
  const Listofproducts({
    required this.brandname,
    super.key,
  });
  final String brandname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: StreamBuilder<List<ProductModel>>(
          stream: FirebaseFirestore.instance
              .collection('categories')
              .doc(brandname)
              .collection(brandname)
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((e) => ProductModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      childAspectRatio: 5 / 7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    List<ProductModel> documentSnapshot = snapshot.data!;

                    return InkWell(
                      onTap: () => Get.to(
                          () =>
                              Productdeatils(product: documentSnapshot[index]),
                          transition: Transition.circularReveal,
                          duration: const Duration(seconds: 2)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kctransperant,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            documentSnapshot[index]
                                                .imagelist[0]),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Positioned(
                                    right: 20,
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(currentemail)
                                            .collection('wishlist')
                                            .snapshots()
                                            .map((snapshot) => snapshot.docs
                                                .map((e) =>
                                                    ProductModel.fromJson(
                                                        e.data()))
                                                .toList()),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final wishlist = snapshot.data;
                                            return IconButton(
                                              icon: Icon(
                                                wishlist!
                                                        .where(
                                                          (item) =>
                                                              item.name ==
                                                              documentSnapshot[
                                                                      index]
                                                                  .name,
                                                        )
                                                        .isEmpty
                                                    ? Icons
                                                        .favorite_outline_rounded
                                                    : Icons.favorite,
                                                size: 30,
                                                color: kred,
                                              ),
                                              onPressed: () async {
                                                wishlist
                                                        .where(
                                                          (item) =>
                                                              item.name ==
                                                              documentSnapshot[
                                                                      index]
                                                                  .name,
                                                        )
                                                        .isNotEmpty
                                                    ? await removefromwislist(
                                                        doc: documentSnapshot[
                                                                index]
                                                            .name)
                                                    : await addtowhishlist(
                                                        product:
                                                            documentSnapshot[
                                                                index]);
                                              },
                                            );
                                          } else {
                                            return const SizedBox();
                                          }
                                        }))
                              ],
                            ),
                            Text(documentSnapshot[index].name,
                                style: klistofproductname),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                kwidth20,
                                const Text(
                                  'Price',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text("₹${documentSnapshot[index].price}"),
                                kwidth20,
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Text('nodata');
            }
          }),
    );
  }
}
