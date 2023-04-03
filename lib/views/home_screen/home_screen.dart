import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/search_controller.dart';
import 'package:samayam/views/home_screen/search_screen_product.dart';
import 'package:samayam/views/home_screen/widgets/popular_brands.dart';
import 'package:samayam/views/home_screen/widgets/my_search.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/settings/settings.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final Searchcontroller searchcontroller = Get.put(Searchcontroller());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Myappbar(
          appbartrailing: IconButton(
              onPressed: () {
                Get.to(() => const Settingspage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 1));
              },
              icon: const Icon(Icons.settings)),
          title: SizedBox(
              height: 80,
              child: Image.asset('lib/asset/LOGO.png', fit: BoxFit.cover)),
        ),
        kheight30,
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Mysearch(),
        ),
        kheight20,
        Text(
          'Categories',
          style: kmainheading,
        ),
        kheight20,
        const PopularBrands(),
        kheight20,
        SizedBox(
          height: 400,
          child: SreachScreenProducts(),
        ),
      ]),
    );
  }
}
