import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/searchcontroller.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/home_screen/widgets/fevorateicon.dart';
import 'package:samayam/views/productdetails/productdetails.dart';

class SreachScreenProducts extends StatelessWidget {
  SreachScreenProducts({
    super.key,
  });
  Searchcontroller searchcontroller = Get.put(Searchcontroller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: StreamBuilder<List<ProductModel>>(
          stream: FirebaseFirestore.instance
              .collection('search')
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((e) => ProductModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 180,
                            childAspectRatio: 5 / 7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      List<ProductModel> documentSnapshot = snapshot.data!;
                      if (searchcontroller.name.isEmpty) {
                        return InkWell(
                          onTap: () => Get.to(
                              () => Productdeatils(
                                  product: documentSnapshot[index]),
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
                                    Favorateicon(
                                      documentSnapshot: documentSnapshot,
                                      index: index,
                                    )
                                  ],
                                ),
                                Text(documentSnapshot[index].name,
                                    style: klistofproductname),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                      }
                      if (documentSnapshot[index]
                          .name
                          .startsWith(searchcontroller.name.toLowerCase())) {
                        return InkWell(
                          onTap: () => Get.to(
                              () => Productdeatils(
                                  product: documentSnapshot[index]),
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
                                    Favorateicon(
                                        documentSnapshot: documentSnapshot,
                                        index: index)
                                  ],
                                ),
                                Text(documentSnapshot[index].name,
                                    style: klistofproductname),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                      }
                    });
          }),
    );
  }
}
