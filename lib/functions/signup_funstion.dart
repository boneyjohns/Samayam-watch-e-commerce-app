import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      .createUserWithEmailAndPassword(
    email: useremail,
    password: userpassword,
  )
      .then((value) async {
    await signupUser(
        username: username,
        userpassword: userpassword,
        useremail: useremail,
        image:
            'https://thumbs.dreamstime.com/z/businessman-icon-image-male-avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
        phone: phone,
        address: 'please add an address');
    log('usercreated');
    await addUser();
    Get.offAll(() => Signin());
  });
}

Future addUser() async {
  final email = FirebaseAuth.instance.currentUser!.email;

  log(email.toString());

  final docUser = FirebaseFirestore.instance.collection('users').doc(email);

  Map<String, dynamic> map = {
    'email': email,
  };
  await docUser.set(map);
  log('new user created n added to databse');
}
