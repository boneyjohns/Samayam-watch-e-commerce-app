import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/funstons/wishlist_fun.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/productdetails/productdetails.dart';

class Wishlistproducts extends StatelessWidget {
  const Wishlistproducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: StreamBuilder<List<ProductModel>>(
          stream: FirebaseFirestore.instance
              .collection('wishlist')
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
                          Productdeatils(
                            product: ProductModel(
                                name: documentSnapshot[index].name,
                                doc: documentSnapshot[index].doc,
                                price: documentSnapshot[index].price,
                                quantity: documentSnapshot[index].quantity,
                                displaytype:
                                    documentSnapshot[index].displaytype,
                                modelname: documentSnapshot[index].modelname,
                                strapcolour:
                                    documentSnapshot[index].strapcolour,
                                straptype: documentSnapshot[index].straptype,
                                warrantyperiod:
                                    documentSnapshot[index].warrantyperiod,
                                dualtime: documentSnapshot[index].dualtime,
                                imagelist: documentSnapshot[index].imagelist),
                            displaytype: documentSnapshot[index].displaytype,
                            dualtime: documentSnapshot[index].dualtime,
                            modelname: documentSnapshot[index].modelname,
                            name: documentSnapshot[index].name,
                            price: documentSnapshot[index].price,
                            quantity: documentSnapshot[index].quantity,
                            strapcolor: documentSnapshot[index].strapcolour,
                            straptype: documentSnapshot[index].straptype,
                            waranty: documentSnapshot[index].warrantyperiod,
                            images: documentSnapshot[index].imagelist,
                          ),
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
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: kred,
                                      ),
                                      onPressed: () {
                                        removefromwislist(
                                            doc: documentSnapshot[index].doc);
                                      },
                                    ))
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
                                Text(documentSnapshot[index].price),
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
