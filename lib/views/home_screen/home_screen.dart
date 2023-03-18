import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/home_screen/widgets/listofpopularbrands.dart';
import 'package:samayam/views/home_screen/widgets/listofproducts.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/settings/settings.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            filled: true,
            fillColor: Colors.transparent.withOpacity(0.3),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
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
