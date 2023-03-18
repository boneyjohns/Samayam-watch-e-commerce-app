// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/signup_funstion.dart';
import 'package:samayam/views/user_login_page/widgets/loginpageanimation.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

class SignUp extends StatelessWidget {
  SignUp({
    super.key,
  });
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight20,
            const Loginpageanimation(),
            kheight20,
            Mytextformfield(
              hide: false,
              keyboardtype: TextInputType.name,
              text: 'Username',
              preicon: Icons.person,
              mycontroller: usernamecontroller,
            ),
            kheight20,
            Mytextformfield(
                hide: false,
                keyboardtype: TextInputType.phone,
                text: 'Phone',
                preicon: Icons.phone,
                mycontroller: phonecontroller),
            kheight20,
            Mytextformfield(
                hide: false,
                keyboardtype: TextInputType.emailAddress,
                text: 'Email',
                preicon: Icons.mail,
                mycontroller: emailcontroller),
            kheight20,
            Mytextformfield(
                hide: true,
                keyboardtype: TextInputType.visiblePassword,
                text: 'Password',
                preicon: Icons.lock,
                mycontroller: passwordcontroller),
            kheight20,
            ElevatedButton(
                onPressed: () {
                  signupfun(
                      phone: phonecontroller.text,
                      useremail: emailcontroller.text,
                      username: usernamecontroller.text,
                      userpassword: passwordcontroller.text);
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
  }
}
