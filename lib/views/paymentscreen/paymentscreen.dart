import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';

import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/productdetailcheckoutbox.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Myappbar(
          title: const Text('Payment method'),
          appbartrailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ),
      ),
      body: Stack(
        children: [
          const Mysplashpaint(),
          SingleChildScrollView(
            child: Column(children: [
              kheight20,
              Text(
                'Delivery Address',
                style: klogintext,
              ),
              kheight20,
              Container(
                height: 165,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kctransperant),
                child: Text(
                  '''Boney johns
                      Brototype
                      maradu 
                      pin : 255554''',
                  style: kcartliststyle,
                ),
              ),
              kheight30,
              Text(
                "Select a payment method",
                style: klogintext,
              ),
              kheight20,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kctransperant),
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
              kheight20,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kctransperant),
                height: 50,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://st2.depositphotos.com/1031343/6862/v/950/depositphotos_68629709-stock-illustration-cash-on-delivery-label-sticker.jpg'),
                    ),
                    kwidth20,
                    Text(
                      'cash on delivey',
                      style: knotificationstyle,
                    ),
                    kwidth20
                  ],
                ),
              ),
              kheight30,
              const Productdetailbox()
            ]),
          ),
        ],
      ),
    );
  }
}
