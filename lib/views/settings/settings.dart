import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/views/settings/widget/settinglisttile.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/signin.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: kappbarcolor,
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Stack(
        children: [
          const Mysplashpaint(),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                      title: 'SAMAYAM',
                      middleText:
                          ' This app is developed and designed by BONEY JOHNS',
                      confirm: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Ok')));
                },
                child: const Settinglisttile(
                    icon: Icon(
                      Icons.info,
                      color: kblack,
                    ),
                    title: 'Info'),
              ),
              const Settinglisttile(
                  icon: Icon(
                    Icons.lock,
                    color: kblack,
                  ),
                  title: 'Privacy Policy'),
              const Settinglisttile(
                  icon: Icon(Icons.notifications, color: kblack),
                  title: 'Invite Friends'),
              const Settinglisttile(
                  icon: Icon(
                    Icons.balance_rounded,
                    color: kblack,
                  ),
                  title: 'Terms & Conditions'),
              kheight30,
              GestureDetector(
                  onTap: () {
                    _dialogBuilder(context);
                  },
                  child: const Settinglisttile(
                      icon: Icon(
                        Icons.door_back_door_sharp,
                        color: kred,
                      ),
                      title: 'Logout')),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure'),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('No')),
            TextButton(
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Get.off(() => Signin(),
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 2));
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }
}
