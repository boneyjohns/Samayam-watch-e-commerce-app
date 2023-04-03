import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/add_order.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/functions/pay.dart';
import 'package:samayam/functions/user_address.dart';
import 'package:samayam/model/order_model.dart';
import 'package:samayam/model/product_model.dart';
import 'package:samayam/model/profile_model.dart';
import 'package:samayam/views/navigation_screen/navigation_page.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/paymentscreen/widgets/paymentdiscription.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';

class Paymentscreen extends StatelessWidget {
  Paymentscreen({super.key, required this.product});

  final TextEditingController addresscontroller = TextEditingController();
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Myappbar(
          title: Text(
            'Payment method',
            style: kappbartext,
          ),
          appbartrailing: Addaddress(addresscontroller: addresscontroller),
        ),
      ),
      body: Stack(
        children: [
          const Mysplashpaint(),
          SingleChildScrollView(
            child: Column(children: [
              kheight20,
              Text(
                'Delivery Address',
                style: klogintext,
              ),
              kheight20,
              Container(
                height: 165,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kctransperant),
                child: StreamBuilder<List<ProfileModel>>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentemail)
                        .collection('userdetails')
                        .snapshots()
                        .map((event) => event.docs
                            .map((e) => ProfileModel.fromJson(e.data()))
                            .toList()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProfileModel> profile = snapshot.data!;
                        return ListView(
                          children: [
                            Center(
                              child: Text(
                                profile[0].address.toString(),
                                style: kpaymentstyle,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const CircleAvatar();
                      }
                    }),
              ),
              kheight20,
              Text(
                'Payment details',
                style: klogintext,
              ),
              kheight30,
              Paymentdiscription(price: product.price),
              kheight30,
              Text(
                "Select a payment method",
                style: klogintext,
              ),
              kheight20,
              GestureDetector(
                onTap: () {
                  Pay(product).paymentmodel();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kctransperant),
                  height: 50,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://yt3.ggpht.com/ytc/AMLnZu8hEuwIDjx39XqXih5os_s6PVzgsptnGb8Q1tkKvw=s900-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                      kwidth20,
                      Text(
                        'Razorpay',
                        style: kbuttonstyle,
                      ),
                      kwidth20
                    ],
                  ),
                ),
              ),
              kheight20,
              GestureDetector(
                onTap: () async {
                  await addorder(
                      orderModel: OrderedProduct(
                    images: product.imagelist,
                    isCanceled: false,
                    name: product.name,
                    isDelivered: false,
                    orderquantity: 1,
                    price: product.price,
                    analog: product.displaytype,
                    id: product.doc,
                    dualtime: product.dualtime,
                    modelname: product.modelname,
                    strapcolour: product.strapcolour,
                    straptype: product.straptype,
                    warrantyperiod: product.warrantyperiod,
                  ));
                  Get.defaultDialog(
                    title: 'Your Order Successfull',
                    middleText: 'For more details,\n check Delivery Status',
                    onConfirm: () => Get.off(() => const Navigationpage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 1)),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kctransperant),
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://st2.depositphotos.com/1031343/6862/v/950/depositphotos_68629709-stock-illustration-cash-on-delivery-label-sticker.jpg'),
                      ),
                      kwidth20,
                      Text(
                        'cash on delivey',
                        style: kbuttonstyle,
                      ),
                      kwidth20
                    ],
                  ),
                ),
              ),
              kheight30,
            ]),
          ),
        ],
      ),
    );
  }
}
