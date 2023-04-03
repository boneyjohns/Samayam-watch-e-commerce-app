import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/model/profile_model.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/profile_screen/profile_edit_screen.dart';
import 'package:samayam/views/profile_screen/widget/profile_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String imageurl =
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
                        Get.to(
                            () => EditProfileScreen(
                                  name: profile[0].username ?? '',
                                  phone: profile[0].userphoneNo ?? '',
                                  editimag: profile[0].image.toString(),
                                ),
                            transition: Transition.circularReveal,
                            duration: const Duration(seconds: 1));
                      },
                      icon: const Icon(Icons.edit)),
                  title: Text(
                    'Profile',
                    style: kappbartext,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CircleAvatar(
                    radius: 130,
                    backgroundImage: NetworkImage(profile[0].image.toString())),
                kheight30,
                Text(profile[0].username ?? 'nousername', style: kmainheading),
                kheight20,
                Text(
                  'Email Address',
                  style: kcheckoutboxred,
                ),
                Profilefield(
                  data: profile[0].useremail ?? 'noemail',
                ),
                kheight20,
                Text(
                  'Phone Numer',
                  style: kcheckoutboxred,
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
