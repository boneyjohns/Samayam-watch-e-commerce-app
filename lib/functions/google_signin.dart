import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samayam/services/signup_services.dart';
import 'package:samayam/views/navigation_screen/navigation_page.dart';

void signinwithgoogle() async {
  GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleauth = await googleuser?.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final name = FirebaseAuth.instance.currentUser!.displayName;
    final email = FirebaseAuth.instance.currentUser!.email;
    final phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    final image = FirebaseAuth.instance.currentUser!.photoURL;
    await signupUser(
        image: image ??
            'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
        username: name ?? 'No username',
        userpassword: '',
        useremail: email.toString(),
        phone: phone ?? 'No phone number',
        address: 'please add an address');

    // ignore: unnecessary_null_comparison
    if (userCredential != null) {
      Get.offAll(() => const Navigationpage(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1));
    }
  } on FirebaseAuthException catch (e) {
    log('error $e');
  }
}
