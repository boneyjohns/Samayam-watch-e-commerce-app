import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/views/settings/settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/cart_screen/widget/cartlist.dart';
import 'package:samayam/views/cart_screen/widget/checkoutbob.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Myappbar(
          appbartrailing: IconButton(
              onPressed: () {
                Get.to(const Settingspage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              icon: const Icon(Icons.settings)),
          title: const Text('Wishlist'),
        ),
        kheight20,
        StreamBuilder<List<ProductModel>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentemail)
                .collection('cart')
                .snapshots()
                .map((snapshot) => snapshot.docs
                    .map((e) => ProductModel.fromJson(e.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> docSnapshot = snapshot.data!;
                return Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Cartlist(
                        product: docSnapshot[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => kheight10,
                  ),
                );
              } else {
                return const Text('nodata');
              }
            }),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Checkoutbox(),
        ),
      ],
    );
  }
}
