import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/signin.dart';
import 'package:samayam/views/user_login_page/signin_page.dart';
import 'package:samayam/views/user_login_page/widgets/my_text_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController forgotPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Forgot password",
            style: kappbartext,
          ),
          backgroundColor: kappbarcolor,
          centerTitle: true,
        ),
        backgroundColor: kwhite,
        body: Stack(
          children: [
            //  const Mysplashpaint(),
            SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                          'lib/asset/forget-password-animation.gif'),
                    ),
                    kheight30,
                    Text(
                        "Enter the email associated with\nyour account and we'll send an\nemail with instructions to reset\nyour password",
                        style: klogintext),
                    kheight30,
                    Mytextformfield(
                      preicon: Icons.email,
                      text: 'Email',
                      mycontroller: forgotPasswordController,
                      hide: false,
                    ),
                    kheight30,
                    GestureDetector(
                      onTap: () async {
                        var forgotEmail = forgotPasswordController.text.trim();
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgotEmail)
                              .then((value) {
                            print('Email send');
                            Get.off(() => Signin());
                          });
                        } on FirebaseAuthException catch (e) {
                          print('Error $e');
                        }
                      },
                      child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              color: kappbarcolor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Reset Passwod',
                              style: kpaymentstyle,
                            ),
                          )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
