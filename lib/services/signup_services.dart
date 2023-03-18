import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signupUser(
  String username,
  String userpassword,
  String useremail,
  String phone,
) async {
  final User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set({
      'username': username,
      'phone': phone,
      'email': useremail,
      'userid': userid.uid
    }).then((value) => {FirebaseAuth.instance.signOut(), Get.back()});
  } on FirebaseAuthException catch (e) {
    log('error is $e');
  }
}
