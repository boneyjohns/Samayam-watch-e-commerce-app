import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/strings.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/signincontroller.dart';
import 'package:samayam/functions/emaillogin.dart';

import 'package:samayam/functions/googlesigninfun.dart';
import 'package:samayam/views/navigation_screen/navigationpage.dart';
import 'package:samayam/views/user_login_page/signinpage.dart';
import 'package:samayam/views/user_login_page/signup_Page.dart';
import 'package:samayam/views/user_login_page/widgets/loginpageanimation.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return SingleChildScrollView(
                child: Signinpage(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error Occured"),
              );
            } else if (snapshot.data != null || snapshot.data!.uid != null) {
              return const Navigationpage();
            } else {
              return SingleChildScrollView(
                child: Signinpage(),
              );
            }
          }),
    );
  }
}
