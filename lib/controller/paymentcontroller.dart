import 'dart:developer';

import 'package:get/get.dart';
import 'package:samayam/model/product_model.dart';

class Paymentcontroller extends GetxController {
  List<ProductModel> paymentlist = [];

  addpaymentproduct(ProductModel product) {
    paymentlist.add(product);
    update();
  }

  removepoduct(ProductModel product) {
    paymentlist
        .removeWhere((element) => element.modelname == product.modelname);
    log(paymentlist.toString() + "gggggggggg");
    update();
  }

  int sum() {
    int newprice = 0;
    if (paymentlist.isEmpty) {
      newprice = 0;

      return newprice;
    } else {
      for (var product in paymentlist) {
        newprice += int.parse(product.price);
      }

      return newprice;
    }
  }
}
