import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/model/product_model.dart';

Future addtowhishlist({required ProductModel product}) async {
  final wishlist =
      FirebaseFirestore.instance.collection('wishlist').doc(product.doc);
  final json = product.toJson();
  await wishlist.set(json);
  log('addtowishlist');
  Get.snackbar('Item Added', 'Product added to wishlist',
      snackPosition: SnackPosition.BOTTOM, backgroundColor: kblue);
}

removefromwislist({required String doc}) async {
  final wishlist = FirebaseFirestore.instance.collection('wishlist').doc(doc);

  await wishlist.delete();
  log('delected');
  Get.snackbar('Item removed', 'Product removed from wishlist',
      backgroundColor: kred, snackPosition: SnackPosition.BOTTOM);
}
