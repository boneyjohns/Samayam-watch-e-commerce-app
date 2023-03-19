import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:samayam/services/signup_services.dart';
import 'package:samayam/views/user_login_page/siigninpage.dart';

signupfun(
    {required String username,
    required String userpassword,
    required String useremail,
    required String phone}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: useremail, password: userpassword)
      .then((value) {
    log('usercreated');
    Get.offAll(() => Signin());
    signupUser(phone, useremail, username, userpassword);
  });
}
