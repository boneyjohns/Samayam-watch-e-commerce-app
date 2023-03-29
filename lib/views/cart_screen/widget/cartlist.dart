import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/controller/paymentcontroller.dart';
import 'package:samayam/functions/addtocart.dart';
import 'package:samayam/model/product_model.dart';

class Cartlist extends StatelessWidget {
  Cartlist({Key? key, required this.product, required this.index})
      : super(key: key);

  ProductModel product;
  int index;
  Paymentcontroller paymentcontroller = Get.put(Paymentcontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kctransperant,
      ),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(product.imagelist[0]),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.name, style: kcartliststyle),
              kheight10,
              Text(
                'Price  ${product.price}',
                style: kcartliststyle,
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                removeFromCart(product: product);
                paymentcontroller.removepoduct(product);
                log(paymentcontroller.paymentlist.length.toString());
              },
              icon: const Icon(
                Icons.delete,
                color: kred,
              ))
        ],
      ),
    );
  }
}
