import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/order_screen/order_product_details.dart';
import 'package:samayam/views/order_screen/widget/order_list.dart';
import 'package:samayam/views/settings/settings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Myappbar(
        appbartrailing: IconButton(
            onPressed: () {
              Get.to(() => const Settingspage(),
                  transition: Transition.circularReveal,
                  duration: const Duration(seconds: 1));
            },
            icon: const Icon(Icons.settings)),
        title: Text(
          'Order History',
          style: kappbartext,
        ),
      ),
      Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentemail)
                  .collection('order')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final orderList = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: orderList.docs.length,
                    separatorBuilder: (context, index) => kheight20,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return GestureDetector(
                          onTap: () => Get.to(
                              () => Orderdetails(
                                    documentSnapshot: documentSnapshot,
                                  ),
                              transition: Transition.circularReveal,
                              duration: const Duration(seconds: 1)),
                          child: Orderlist(documentSnapshot: documentSnapshot));
                    },
                  );
                } else {
                  return const Align(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(
                      color: kwhite,
                    ),
                  );
                }
              }))
    ]);
  }
}
