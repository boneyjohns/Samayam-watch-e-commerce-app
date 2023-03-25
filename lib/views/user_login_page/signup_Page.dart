// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/signincontroller.dart';
import 'package:samayam/functions/signup_funstion.dart';
import 'package:samayam/views/user_login_page/widgets/loginpageanimation.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

class SignUp extends StatelessWidget {
  SignUp({
    super.key,
  });
  final User? currentuser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: 80,
            child: Image.asset('lib/asset/LOGO.png', fit: BoxFit.cover)),
        centerTitle: true,
        backgroundColor: kappbarcolor,
      ),
      body: GetBuilder<Signincontroller>(builder: (c) {
        return SingleChildScrollView(
          child: Form(
            key: signincontroller.signupformkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                kheight20,
                const Loginpageanimation(),
                kheight20,
                Mytextformfield(
                  onSave: (value) {
                    signincontroller.name = value!;
                  },
                  validator: (value) {
                    return signincontroller.validateusername(value!);
                  },
                  hide: false,
                  keyboardtype: TextInputType.name,
                  text: 'Username',
                  preicon: Icons.person,
                  mycontroller: c.namecontroller,
                ),
                kheight20,
                Mytextformfield(
                    onSave: (value) {
                      signincontroller.phone = value!;
                    },
                    validator: (value) {
                      return signincontroller.validatephone(value!);
                    },
                    hide: false,
                    keyboardtype: TextInputType.phone,
                    text: 'Phone',
                    preicon: Icons.phone,
                    mycontroller: c.phonecontroller),
                kheight20,
                Mytextformfield(
                    onSave: (value) {
                      signincontroller.email = value!;
                    },
                    validator: (value) {
                      return signincontroller.validateemail(value!);
                    },
                    hide: false,
                    keyboardtype: TextInputType.emailAddress,
                    text: 'Email',
                    preicon: Icons.mail,
                    mycontroller: c.emailcontroller),
                kheight20,
                Mytextformfield(
                    onSave: (value) {
                      signincontroller.password = value!;
                    },
                    validator: (value) {
                      return signincontroller.validatepassword(value!);
                    },
                    hide: true,
                    keyboardtype: TextInputType.visiblePassword,
                    text: 'Password',
                    preicon: Icons.lock,
                    mycontroller: c.passwordcontroller),
                kheight20,
                ElevatedButton(
                    onPressed: () async {
                      signincontroller.checkSignup();
                      await signupfun(
                          phone: c.phonecontroller.text.trim(),
                          useremail: c.emailcontroller.text,
                          username: c.namecontroller.text,
                          userpassword: c.passwordcontroller.text);
                    },
                    child: Text(
                      'Sign Up',
                      style: kcartliststyle,
                    )),
                GestureDetector(
                  onTap: Get.back,
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Already have an account ",
                          style: klogintext,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
