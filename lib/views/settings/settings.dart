import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/settings/widget/policy_dialog.dart';
import 'package:samayam/views/settings/widget/settings_listtile.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/signin.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: kappbartext,
        ),
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
                  Get.dialog(CupertinoAlertDialog(
                      title: Column(children: [
                    Text('SAMAYAM', style: kmainheading),
                    kheight10,
                    const Text(
                      ' This app is a demo e-commerce app  developed and designed for study purpose by  BONEY JOHNS',
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Ok'))
                  ])));
                },
                child: const Settinglisttile(
                    icon: Icon(
                      Icons.info,
                      color: kblack,
                    ),
                    title: 'Info'),
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(Policydialog(
                    radius: 5,
                    mdFilename: 'privacy_policy.md',
                  ));
                },
                child: const Settinglisttile(
                    icon: Icon(
                      Icons.lock,
                      color: kblack,
                    ),
                    title: 'Privacy Policy'),
              ),
              const Settinglisttile(
                  icon: Icon(Icons.share, color: kblack),
                  title: 'Invite Friends'),
              GestureDetector(
                onTap: () {
                  Get.dialog(Policydialog(
                    radius: 5,
                    mdFilename: 'terms_and_conditions.md',
                  ));
                },
                child: const Settinglisttile(
                    icon: Icon(
                      Icons.balance_rounded,
                      color: kblack,
                    ),
                    title: 'Terms & Conditions'),
              ),
              kheight10,
              GestureDetector(
                  onTap: () {
                    Get.dialog(CupertinoAlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure'),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('No')),
                        TextButton(
                            onPressed: () async {
                              await GoogleSignIn().signOut();
                              await FirebaseAuth.instance.signOut();
                              Get.off(() => const Signin(),
                                  transition: Transition.circularReveal,
                                  duration: const Duration(seconds: 1));
                            },
                            child: const Text('Yes')),
                      ],
                    ));
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
}
