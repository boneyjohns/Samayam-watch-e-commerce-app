import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/paymentscreen/payment_screen.dart';

class Productdetailbox extends StatelessWidget {
  const Productdetailbox({Key? key, required this.brand}) : super(key: key);
  final ProductModel brand;
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
                'Subtotal',
                style: kcheckoutbox,
              ),
              Text(
                '₹${brand.price}',
                style: kcheckoutbox,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Shiping',
                style: kcheckoutbox,
              ),
              Text(
                '₹200',
                style: kcheckoutbox,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Total Cost',
                style: kcheckoutboxred,
              ),
              Text(
                '₹${(int.parse(brand.price) + 200)}',
                style: kcheckoutboxred,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Paymentscreen(product: brand),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 1));
              },
              child: Text(
                "Checkout",
                style: kbuttonstyle,
              ))
        ],
      ),
    );
  }
}
