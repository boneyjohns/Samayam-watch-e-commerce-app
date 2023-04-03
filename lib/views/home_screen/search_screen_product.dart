import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/search_controller.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/home_screen/widgets/fevorate_icon.dart';
import 'package:samayam/views/productdetails/product_details.dart';

class SreachScreenProducts extends StatelessWidget {
  SreachScreenProducts({
    super.key,
  });
  final Searchcontroller searchcontroller = Get.put(Searchcontroller());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
        stream: FirebaseFirestore.instance.collection('search').snapshots().map(
            (snapshot) => snapshot.docs
                .map((e) => ProductModel.fromJson(e.data()))
                .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error Occured"),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text("Empty"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GetBuilder<Searchcontroller>(
                  init: Searchcontroller(),
                  builder: (searchcontroller) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 180,
                                childAspectRatio: 5 / 7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: searchcontroller.searchlist.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () => Get.to(
                                () => Productdeatils(
                                    product:
                                        searchcontroller.searchlist[index]),
                                transition: Transition.circularReveal,
                                duration: const Duration(seconds: 1)),
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
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  searchcontroller
                                                      .searchlist[index]
                                                      .imagelist[0]),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Favorateicon(
                                        documentSnapshot:
                                            searchcontroller.searchlist,
                                        index: index,
                                      )
                                    ],
                                  ),
                                  Text(searchcontroller.searchlist[index].name,
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
                                      Text(
                                          "₹${searchcontroller.searchlist[index].price}"),
                                      kwidth20,
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            );
          }
        });
  }
}
