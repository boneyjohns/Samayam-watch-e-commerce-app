import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:samayam/services/signup_services.dart';
import 'package:samayam/views/user_login_page/signin.dart';

signupfun(
    {required String username,
    required String userpassword,
    required String useremail,
    required String phone}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: useremail, password: userpassword)
      .then((value) async {
    await signupUser(
        username: username,
        userpassword: userpassword,
        useremail: useremail,
        image:
            'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
        phone: phone);
    log('usercreated');
    Get.offAll(() => Signin());
  });
}
