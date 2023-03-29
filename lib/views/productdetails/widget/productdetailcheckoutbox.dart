import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/paymentscreen/paymentscreen.dart';

class Productdetailbox extends StatelessWidget {
  Productdetailbox({Key? key, required this.brand}) : super(key: key);
  ProductModel brand;
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
                style: kcartliststyle,
              ),
              Text(
                '₹${brand.price}',
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
                '₹${(int.parse(brand.price) + 200)}',
                style: kcartliststyle,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Paymentscreen(product: brand),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
              child: const Text("Checkout"))
        ],
      ),
    );
  }
}
