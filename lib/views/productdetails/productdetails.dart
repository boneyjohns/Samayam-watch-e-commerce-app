import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/addtocart.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/productdetails/widget/productdetailcheckoutbox.dart';
import 'package:samayam/views/productdetails/widget/productdetailimg.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Myappbar(
            title: Text(product.name),
            appbartrailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.to(const Settingspage(),
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
                image: product.imagelist[0],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(children: [
                    kheight20,
                    Text(
                      product.name,
                      style: kmaintitle,
                    ),
                    kheight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price   ₹${product.price}'),
                        IconButton(
                            onPressed: () {},
                            icon: IconButton(
                                onPressed: () {
                                  addToCart(product: product);
                                },
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  size: 25,
                                )))
                      ],
                    ),
                    Text('Model Name   ${product.modelname}'),
                    kheight10,
                    Text('Warranty Period   ${product.warrantyperiod}'),
                    kheight10,
                    Text('Quantity   ${product.quantity}'),
                    kheight10,
                    Text('Displaytype   ${product.displaytype}'),
                    kheight10,
                    Text('Modelname   ${product.modelname}'),
                    kheight10,
                    Text('Straptype   ${product.straptype}'),
                    kheight10,
                    Text('Strapcolor   ${product.strapcolour}'),
                    kheight10,
                    Text('Dualtime   ${product.dualtime}'),
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
