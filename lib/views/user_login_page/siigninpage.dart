import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/strings.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/emaillogin.dart';
import 'package:samayam/functions/googlesigninfun.dart';
import 'package:samayam/views/user_login_page/signup_Page.dart';
import 'package:samayam/views/user_login_page/widgets/loginpageanimation.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

class Signin extends StatelessWidget {
  Signin({
    super.key,
  });
  final TextEditingController loginpasswordcontroller = TextEditingController();
  final TextEditingController loginemailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
          title: SizedBox(
              height: 80, child: Image.asset(applogo, fit: BoxFit.cover)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: kappbarcolor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kheight20,
            const Loginpageanimation(),
            kheight20,
            Mytextformfield(
              hide: false,
              keyboardtype: TextInputType.emailAddress,
              text: 'Email',
              preicon: Icons.mail,
              mycontroller: loginemailcontroller,
            ),
            kheight20,
            Mytextformfield(
                keyboardtype: TextInputType.visiblePassword,
                text: 'passsword',
                preicon: Icons.lock,
                hide: true,
                mycontroller: loginpasswordcontroller),
            kheight20,
            ElevatedButton(
                onPressed: () {
                  emaillogin(
                      useremail: loginemailcontroller.text,
                      userpassword: loginpasswordcontroller.text);
                },
                child: Text(
                  'Login',
                  style: kcartliststyle,
                )),
            kheight10,
            InputChip(
              backgroundColor: kwhite,
              onPressed: () {
                signinwithgoogle();
              },
              label: CircleAvatar(
                backgroundColor: kwhite,
                child: Image.network(
                  google,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(() => SignUp(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Don't have an account signUp",
                      style: klogintext,
                    )),
              ),
            ),
            // ignore: prefer_const_constructors
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Forgot password",
                    style: klogintextred,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
