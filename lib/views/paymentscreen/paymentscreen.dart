import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';

import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/productdetailcheckoutbox.dart';
import 'package:samayam/views/settings/settings.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Myappbar(
          title: const Text('Payment method'),
          appbartrailing: IconButton(
              onPressed: () {
                Get.to(const Settings(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              icon: const Icon(Icons.settings)),
        ),
        kheight20,
        const Text('Delivery Address'),
        kheight20,
        Container(
          height: 165,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: kctransperant),
          child: Text(
            '''Boney johns
                Brototype
                maradu 
                pin : 255554''',
            style: kcartliststyle,
          ),
        ),
        kheight30,
        const Text("Select a payment method"),
        kheight20,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: kctransperant),
          height: 50,
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image3.mouthshut.com/images/imagesp/925917641s.png'),
              ),
              kwidth20,
              Text(
                'Google pay',
                style: knotificationstyle,
              ),
              kwidth20
            ],
          ),
        ),
        const Productdetailbox()
      ]),
    );
  }
}
