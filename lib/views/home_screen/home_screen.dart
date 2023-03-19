import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/home_screen/widgets/listofpopularbrands.dart';
import 'package:samayam/views/home_screen/widgets/listofproducts.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/settings/settings.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Myappbar(
        appbartrailing: IconButton(
            onPressed: () {
              Get.to(const Settings(),
                  transition: Transition.circularReveal,
                  duration: const Duration(seconds: 2));
            },
            icon: const Icon(Icons.settings)),
        title: SizedBox(
            height: 80,
            child: Image.asset('lib/asset/LOGO.png', fit: BoxFit.cover)),
      ),
      kheight30,
      Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SearchBarAnimation(
            textEditingController: search,
            isOriginalAnimation: false,
            trailingWidget: const Icon(Icons.search),
            secondaryButtonWidget: const Icon(Icons.close),
            buttonWidget: const Icon(Icons.search),
            buttonColour: kblue,
            buttonShadowColour: kred,
            durationInMilliSeconds: 1000,
          )),
      kheight20,
      Text(
        'Categories',
        style: ktext,
      ),
      kheight20,
      const Listofbrandicons(),
      kheight20,
      const Expanded(
        child: Listofproducts(
          brandname: 'Rolex',
        ),
      ),
    ]);
  }
}
