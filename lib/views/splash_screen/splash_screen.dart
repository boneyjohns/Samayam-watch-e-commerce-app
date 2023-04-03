import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/strings.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/splash_screen/widget/clock_animation.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/signin.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future gotohome() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(() => const Signin(),
        transition: Transition.circularReveal,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gotohome();
    });
    return Scaffold(
      body: Stack(
        children: [
          const Mysplashpaint(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Clockanimation(),
                ],
              ),
              kheight30,
              Text(
                appname,
                style: kapplogo,
              ),
            ],
          )
        ],
      ),
    );
  }
}
