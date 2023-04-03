import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

signupUser({
  required String username,
  required String userpassword,
  required String useremail,
  required String phone,
  required String image,
  required String address,
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
      'image': image,
      'address': address
    });
  } on FirebaseAuthException catch (e) {
    log('error is $e');
  }
}
