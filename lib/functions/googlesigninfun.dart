// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samayam/views/navigation_screen/navigationpage.dart';

void signinwithgoogle() async {
  GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleauth = await googleuser?.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential != null) {
      Get.offAll(() => const Navigationpage(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 2));
    } else {}
  } on FirebaseAuthException catch (e) {
    log('error $e');
  }
}
