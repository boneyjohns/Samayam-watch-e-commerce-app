import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:samayam/views/navigation_screen/navigation_page.dart';

emaillogin({required String useremail, required String userpassword}) async {
  try {
    final User? firebaseuser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: useremail, password: userpassword))
        .user;
    if (firebaseuser != null) {
      Get.offAll(() => const Navigationpage(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1));
    } else {}
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print('error $e');
  }
}
