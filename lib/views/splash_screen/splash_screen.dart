import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/navigation/navigationpage.dart';
import 'package:samayam/views/splash_screen/widget/clock_animation.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> gotohome() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.to(const Navigationpage());
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
              khignt30,
              Text(
                'Samayam',
                style: kmaintitle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
