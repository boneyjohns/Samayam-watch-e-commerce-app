import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/productdetailcheckoutbox.dart';
import 'package:samayam/views/productdetails/widget/productdetailimg.dart';
import 'package:samayam/views/settings/settings.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Productdeatils extends StatelessWidget {
  const Productdeatils(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      required this.strapcolor,
      required this.straptype,
      required this.displaytype,
      required this.dualtime,
      required this.waranty,
      required this.modelname,
      required this.product,
      required this.images});
  final String name;
  final String price;
  final String quantity;
  final String strapcolor;
  final String straptype;
  final String displaytype;
  final List images;
  final String dualtime;
  final String waranty;
  final String modelname;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Myappbar(
            title: Text(name),
            appbartrailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.to(const Settings(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 2));
              },
            )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Mysplashpaint(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Productdetailimg(
                product: product,
                image: images,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(children: [
                    kheight20,
                    Text(
                      name,
                      style: kmaintitle,
                    ),
                    kheight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price   ₹$price'),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              size: 25,
                            ))
                      ],
                    ),
                    Text('Model Name   $modelname'),
                    kheight10,
                    Text('Warranty Period   $waranty'),
                    kheight10,
                    Text('Quantity   $quantity'),
                    kheight10,
                    Text('Displaytype   $displaytype'),
                    kheight10,
                    Text('Modelname   $modelname'),
                    kheight10,
                    Text('Straptype   $straptype'),
                    kheight10,
                    Text('Strapcolor   $strapcolor'),
                    kheight10,
                    Text('Dualtime   $dualtime'),
                    kheight30,
                    const Productdetailbox()
                  ]),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
