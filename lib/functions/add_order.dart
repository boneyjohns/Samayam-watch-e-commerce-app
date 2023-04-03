import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/model/order_model.dart';

Future addorder({
  required OrderedProduct orderModel,
}) async {
  final userdoc = FirebaseFirestore.instance
      .collection('users')
      .doc(currentemail)
      .collection('order')
      .doc(orderModel.id);

  final json = orderModel.toJson();

  await userdoc.set(json);
  log('product added to order');
}

removeFromorder({required String id}) {
  final docProduct = FirebaseFirestore.instance
      .collection('users')
      .doc(currentemail)
      .collection('order')
      .doc(id);
  docProduct.delete();
}
