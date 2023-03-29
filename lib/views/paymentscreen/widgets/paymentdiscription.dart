import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';

class Paymentdiscription extends StatelessWidget {
  const Paymentdiscription({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
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
                  price,
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
                  '₹200',
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
                  '${double.parse(price) + 200}',
                  style: kcartliststyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
