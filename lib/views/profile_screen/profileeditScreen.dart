import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/functions/editprofile.dart';
import 'package:samayam/functions/imagepicker.dart';
import 'package:samayam/model/profilemodel.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/splash_screen/widget/splash_paint.dart';
import 'package:samayam/views/user_login_page/widgets/mytext_field.dart';

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
                const Myappbar(
                  appbartrailing: kwidth20,
                  title: Text('Edit Profile '),
                ),
                const SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: NetworkImage(widget.editimag),
                ),
                IconButton(
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
                kheight30,
                Text('UserName', style: knotificationstyle),
                kheight10,
                Mytextformfield(
                    text: 'name',
                    preicon: Icons.person,
                    mycontroller: namecontroller,
                    hide: false),
                kheight10,
                Text("phone", style: knotificationstyle),
                kheight20,
                Mytextformfield(
                    text: 'phone',
                    preicon: Icons.phone,
                    mycontroller: phonecontroller,
                    hide: false),
                kheight30,
                InputChip(
                  label: const Text('Submit'),
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
