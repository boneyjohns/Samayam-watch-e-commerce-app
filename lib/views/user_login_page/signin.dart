import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/navigation_screen/navigation_page.dart';
import 'package:samayam/views/user_login_page/signin_page.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: kappbartext,
        ),
        centerTitle: true,
        backgroundColor: kappbarcolor,
      ),
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
              // ignore: unnecessary_null_comparison
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
