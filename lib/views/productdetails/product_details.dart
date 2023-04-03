import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/add_to_cart.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/product_detail_checkout_box.dart';
import 'package:samayam/views/productdetails/widget/product_detail_image.dart';
import 'package:samayam/views/settings/settings.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Productdeatils extends StatelessWidget {
  const Productdeatils({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Myappbar(
            title: Text(
              product.name,
              style: kappbartext,
            ),
            appbartrailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.to(() => const Settingspage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 1));
              },
            )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(painter: Mypaint1(), child: Container()),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Productdetailimg(
                product: product,
                image: product.imagelist[0],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView(children: [
                    kheight20,
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Price                                     ₹${product.price}',
                            style: kproductdiscriptionred),
                        IconButton(
                            onPressed: () {},
                            icon: IconButton(
                                onPressed: () {
                                  addToCart(product: product);
                                },
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  size: 25,
                                  color: kblue,
                                )))
                      ],
                    ),
                    Text(
                        'Model Name                       ${product.modelname}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Warranty Period              ${product.warrantyperiod}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Quantity                             ${product.quantity}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Displaytype                       ${product.displaytype}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Straptype                          ${product.straptype}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Strapcolor                         ${product.strapcolour}',
                        style: kproductdiscription),
                    kheight10,
                    Text(
                        'Dualtime                            ${product.dualtime}',
                        style: kproductdiscription),
                    kheight30,
                    Productdetailbox(
                      brand: product,
                    )
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
