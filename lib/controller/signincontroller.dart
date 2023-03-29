import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final signincontroller = Get.put(Signincontroller());

class Signincontroller extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  late TextEditingController emailcontroller,
      passwordcontroller,
      phonecontroller,
      namecontroller;
  var email = '';
  var phone = '';
  var name = '';
  var password = '';
  @override
  void onInit() {
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();

    phonecontroller = TextEditingController();
    namecontroller = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String? validateemail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.length < 6) {
      return 'please enter a valid password';
    }
    return null;
  }

  String? validatephone(String value) {
    if (value.length < 10) {
      return 'please enter a 10 digit phone number';
    }
    return null;
  }

  String? validateusername(String value) {
    if (!GetUtils.isUsername(value)) {
      return 'please enter name';
    }
    return null;
  }

  void checkLogin() {
    final isvalid = loginFormKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    loginFormKey.currentState!.save();
  }

  void checkSignup() {
    final isvalid = signupformkey.currentState!.validate();
    if (!isvalid) {
      return log(name);
    }
    loginFormKey.currentState!.save();
  }
}
