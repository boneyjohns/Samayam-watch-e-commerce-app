import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/strings.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/signin_controller.dart';
import 'package:samayam/functions/email_login.dart';
import 'package:samayam/functions/google_signin.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/user_login_page/forgetpassword.dart';
import 'package:samayam/views/user_login_page/signup_Page.dart';
import 'package:samayam/views/user_login_page/widgets/login_page_animation.dart';
import 'package:samayam/views/user_login_page/widgets/my_text_field.dart';

class Signinpage extends StatelessWidget {
  Signinpage({
    super.key,
  });
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final signincontroller = Get.put(Signincontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Myappbar(
          appbartrailing: const SizedBox(),
          title: Text(
            'Login',
            style: kappbartext,
          ),
        ),
        Form(
            key: signincontroller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                kheight20,
                const Loginpageanimation(),
                kheight20,
                Mytextformfield(
                  validator: (value) {
                    return signincontroller.validateemail(value ?? '');
                  },
                  hide: false,
                  keyboardtype: TextInputType.emailAddress,
                  text: 'Email',
                  preicon: Icons.mail,
                  mycontroller: emailcontroller,
                ),
                kheight20,
                Mytextformfield(
                    validator: (value) {
                      return signincontroller.validatepassword(value ?? '');
                    },
                    keyboardtype: TextInputType.visiblePassword,
                    text: 'passsword',
                    preicon: Icons.lock,
                    hide: true,
                    mycontroller: passwordcontroller),
                kheight20,
                InputChip(
                    backgroundColor: kappbarcolor,
                    onPressed: () async {
                      signincontroller.checkLogin();

                      await emaillogin(
                          useremail: emailcontroller.text.trim(),
                          userpassword: passwordcontroller.text.trim());
                    },
                    label: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'Login',
                          style: kpaymentstyle,
                        ),
                      ),
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
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUp(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 1));
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
                GestureDetector(
                  onTap: () => Get.to(ForgotPassword()),
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Forgot password",
                          style: klogintextred,
                        )),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
