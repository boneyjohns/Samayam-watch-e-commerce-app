import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:samayam/functions/add_order.dart';
import 'package:samayam/model/order_model.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/views/navigation_screen/navigation_page.dart';

class Pay {
  final ProductModel brand;

  Razorpay razorpay = Razorpay();

  Pay(this.brand);
  paymentmodel() {
    var options = {
      'key': 'rzp_test_FXs5QJNU6J151U',
      'amount': (int.parse(brand.price) + 200) * 100,
      'name': 'Samayam',
      'description': int.parse(brand.price) + 200 * 100,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '623828162', 'email': 'boneyjohns007@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void handlePaymentErrorResponse(
      PaymentFailureResponse response, BuildContext context) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(
    PaymentSuccessResponse response,
  ) async {
    log(response.toString());

    await addorder(
        orderModel: OrderedProduct(
      images: brand.imagelist,
      isCanceled: false,
      name: brand.name,
      isDelivered: false,
      orderquantity: 1,
      price: brand.price,
      analog: brand.displaytype,
      id: brand.doc,
      dualtime: brand.dualtime,
      modelname: brand.modelname,
      strapcolour: brand.strapcolour,
      straptype: brand.straptype,
      warrantyperiod: brand.warrantyperiod,
    ));
    Get.defaultDialog(
      title: 'Your Order Successfull',
      middleText: 'For more details,\n check Delivery Status',
      onConfirm: () => Get.off(() => const Navigationpage(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1)),
    );
  }

  void handleExternalWalletSelected(
      ExternalWalletResponse response, BuildContext context) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }
}
