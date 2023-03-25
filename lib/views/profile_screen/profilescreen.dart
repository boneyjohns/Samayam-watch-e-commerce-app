import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/model/profilemodel.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/profile_screen/profileeditScreen.dart';

import 'package:samayam/views/profile_screen/widget/profilefield.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  String imageurl =
      'https://imageio.forbes.com/specials-images/imageserve/63974b591dbcd3145c446ad4/Elon-Musk/1960x0.jpg?format=jpg&width=960';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProfileModel>>(
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
            return Column(
              children: [
                Myappbar(
                  appbartrailing: IconButton(
                      onPressed: () {
                        Get.to(() => EditProfileScreen(
                              name: profile[0].username ?? '',
                              phone: profile[0].userphoneNo ?? '',
                              editimag: profile[0].image.toString(),
                            ));
                      },
                      icon: const Icon(Icons.edit)),
                  title: const Text('Profile'),
                ),
                const SizedBox(
                  height: 60,
                ),
                CircleAvatar(
                    radius: 130,
                    backgroundImage: NetworkImage(profile[0].image.toString())),
                kheight30,
                Text(profile[0].username ?? 'nousername',
                    style: kprofilenamestyle),
                kheight20,
                Text(
                  'Email Address',
                  style: knotificationstyle,
                ),
                Profilefield(
                  data: profile[0].useremail ?? 'noemail',
                ),
                kheight20,
                Text(
                  'Phone Numer',
                  style: knotificationstyle,
                ),
                Profilefield(data: profile[0].userphoneNo ?? 'no phone number')
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
