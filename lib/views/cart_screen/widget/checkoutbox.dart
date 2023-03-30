import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/paymentcontroller.dart';

class Checkoutbox extends StatelessWidget {
  Checkoutbox({
    Key? key,
  }) : super(key: key);
  Paymentcontroller paymentcontroller = Get.put(Paymentcontroller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Paymentcontroller>(builder: (controller) {
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
                  'Subtotal',
                  style: kcartliststyle,
                ),
                Text(
                  controller.sum().toString(),
                  style: kcartliststyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Shiping',
                  style: kcartliststyle,
                ),
                Text(
                  '200',
                  style: kcartliststyle,
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                'Total Cost',
                style: kcartliststyle,
              ),
              Text(
                controller.sum().toString(),
                style: kcartliststyle,
              )
            ]),
            ElevatedButton(onPressed: () {}, child: const Text("Checkout"))
          ],
        ),
      );
    });
  }
}
