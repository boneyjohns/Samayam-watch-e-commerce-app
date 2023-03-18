import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:samayam/services/signup_services.dart';

signupfun(
    {required String username,
    required String userpassword,
    required String useremail,
    required String phone}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: useremail, password: userpassword)
      .then((value) {
    log('usercreated');
    signupUser(phone, useremail, username, userpassword);
  });
}
