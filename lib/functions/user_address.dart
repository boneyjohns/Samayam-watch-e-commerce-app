import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/model/profile_model.dart';

class Addaddress extends StatelessWidget {
  const Addaddress({
    super.key,
    required this.addresscontroller,
  });

  final TextEditingController addresscontroller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.defaultDialog(
              title: 'Please enter your address',
              content: TextFormField(
                controller: addresscontroller,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
              ),
              cancel: ActionChip(
                label: const Text(
                  'Cancel',
                  style: TextStyle(color: kred),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              confirm: InputChip(
                label: const Text(
                  'Conform',
                  style: TextStyle(color: kblue),
                ),
                onPressed: () {
                  editaddress(
                      profileModel: ProfileModel(
                          useremail: currentemail,
                          address: addresscontroller.text));
                  Get.back();
                },
              ));
        },
        icon: const Icon(Icons.edit));
  }
}

Future editaddress({required ProfileModel profileModel}) async {
  final user = FirebaseFirestore.instance
      .collection('users')
      .doc(currentemail)
      .collection('userdetails')
      .doc('userdetails');
  final json = profileModel.toJson();
  await user.update(json);
}
