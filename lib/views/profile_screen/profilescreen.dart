import 'package:flutter/material.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';
import 'package:samayam/views/navigation_screen/widget/myappbar.dart';
import 'package:samayam/views/profile_screen/widget/addimage.dart';
import 'package:samayam/views/profile_screen/widget/profilefield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Myappbar(
          appbartrailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          title: const Text('Profile'),
        ),
        const SizedBox(
          height: 100,
        ),
        const Addimage(),
        kheight30,
        Text("Elon mask", style: kprofilenamestyle),
        kheight20,
        Text(
          'Email Address',
          style: knotificationstyle,
        ),
        const Profilefield(
          data: 'elonmask@9844.com',
        ),
        kheight20,
        Text(
          'Phone Numer',
          style: knotificationstyle,
        ),
        const Profilefield(data: '6561516566')
      ],
    );
  }
}
