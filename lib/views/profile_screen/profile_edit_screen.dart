import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/edit_profile.dart';
import 'package:samayam/functions/image_picker.dart';
import 'package:samayam/model/profile_model.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/widgets/my_text_field.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatefulWidget {
  EditProfileScreen(
      {super.key,
      required this.name,
      required this.phone,
      required this.editimag});
  final String name;
  final String phone;
  String editimag;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final namecontroller = TextEditingController(text: widget.name);

  late final phonecontroller = TextEditingController(text: widget.phone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Mysplashpaint(),
          SingleChildScrollView(
            child: Column(
              children: [
                Myappbar(
                  appbartrailing: kwidth20,
                  title: Text(
                    'Edit Profile ',
                    style: kappbartext,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 150,
                      backgroundImage: NetworkImage(widget.editimag),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 135,
                      child: IconButton(
                          onPressed: () {
                            setState(() async {
                              final imageurl = await Images.getimage();

                              setState(() {});
                              widget.editimag = imageurl!;
                              log(imageurl.toString());
                            });
                          },
                          icon: const Icon(
                            Icons.camera_alt_sharp,
                            color: kred,
                            size: 50,
                          )),
                    ),
                  ],
                ),
                kheight30,
                Text('UserName', style: kcheckoutboxred),
                kheight10,
                Mytextformfield(
                    text: 'name',
                    preicon: Icons.person,
                    mycontroller: namecontroller,
                    hide: false),
                kheight10,
                Text("phone", style: kcheckoutboxred),
                kheight20,
                Mytextformfield(
                    text: 'phone',
                    preicon: Icons.phone,
                    mycontroller: phonecontroller,
                    hide: false),
                kheight30,
                InputChip(
                  label: Text(
                    'Submit',
                    style: kbuttonstyle,
                  ),
                  onPressed: () async {
                    await editprofile(
                        profileModel: ProfileModel(
                            useremail: currentemail,
                            username: namecontroller.text,
                            userphoneNo: phonecontroller.text,
                            image: widget.editimag));
                    log('edited');
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
