import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/strings.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/signincontroller.dart';
import 'package:samayam/functions/emaillogin.dart';
import 'package:samayam/functions/googlesigninfun.dart';
import 'package:samayam/views/user_login_page/signup_Page.dart';
import 'package:samayam/views/user_login_page/widgets/loginpageanimation.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

class Signinpage extends StatelessWidget {
  Signinpage({
    super.key,
  });

  Signincontroller signincontroller = Get.put(Signincontroller());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signincontroller.loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          kheight20,
          const Loginpageanimation(),
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
            mycontroller: signincontroller.emailcontroller,
          ),
          kheight20,
          Mytextformfield(
              onSave: (value) {
                signincontroller.password = value!;
              },
              validator: (value) {
                return signincontroller.validatepassword(value!);
              },
              keyboardtype: TextInputType.visiblePassword,
              text: 'passsword',
              preicon: Icons.lock,
              hide: true,
              mycontroller: signincontroller.passwordcontroller),
          kheight20,
          InputChip(
              backgroundColor: kblue,
              onPressed: () async {
                signincontroller.checkLogin();

                await emaillogin(
                    useremail: signincontroller.email,
                    userpassword: signincontroller.password);
              },
              label: Text(
                'Login',
                style: kcartliststyle,
              )),
          kheight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                pressElevation: 30,
              ),
              InputChip(
                backgroundColor: kwhite,
                pressElevation: 50,
                label: const Icon(
                  Icons.phone,
                  color: kred,
                ),
                onPressed: () {},
              )
            ],
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
    );
  }
}