import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/functions/userAddress.dart';
import 'package:samayam/model/profilemodel.dart';

import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/productdetailcheckoutbox.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Paymentscreen extends StatelessWidget {
  Paymentscreen({super.key});

  final TextEditingController addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Myappbar(
          title: const Text('Payment method'),
          appbartrailing: Addaddress(addresscontroller: addresscontroller),
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
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kctransperant),
                child: StreamBuilder<List<ProfileModel>>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentemail)
                        .collection('userdetails')
                        .snapshots()
                        .map((event) => event.docs
                            .map((e) => ProfileModel.fromJson(e.data()))
                            .toList()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProfileModel> profile = snapshot.data!;
                        return ListView(
                          children: [
                            Center(
                              child: Text(
                                profile[0].address.toString(),
                                style: kcartliststyle,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return CircleAvatar();
                      }
                    }),
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
