import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/notification_screen/widget/orderlist.dart';
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
                  duration: const Duration(seconds: 2));
            },
            icon: const Icon(Icons.settings)),
        title: const Text('Order History'),
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
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => kheight20,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return Orderlist(documentSnapshot: documentSnapshot);
                    },
                  );
                } else {
                  return const Align(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              }))
    ]);
  }
}
