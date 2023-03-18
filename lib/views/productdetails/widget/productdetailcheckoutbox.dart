import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/paymentscreen/paymentscreen.dart';

class Productdetailbox extends StatelessWidget {
  const Productdetailbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kctransperant),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'amount',
                style: kcartliststyle,
              ),
              Text(
                '42000',
                style: kcartliststyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'shiping',
                style: kcartliststyle,
              ),
              Text(
                '2000',
                style: kcartliststyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Total Cost',
                style: kcartliststyle,
              ),
              Text(
                '44000',
                style: kcartliststyle,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(const Paymentscreen(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              child: const Text("Checkout"))
        ],
      ),
    );
  }
}