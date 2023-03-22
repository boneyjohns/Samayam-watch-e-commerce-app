import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signupUser({
  required String username,
  required String userpassword,
  required String useremail,
  required String phone,
  required String image,
}) async {
  final User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(useremail)
        .collection('userdetails')
        .doc('userdetails')
        .set({
      'username': username,
      'phone': phone,
      'email': useremail,
      'userid': userid!.uid,
      'image': image
    });
  } on FirebaseAuthException catch (e) {
    log('error is $e');
  }
}
