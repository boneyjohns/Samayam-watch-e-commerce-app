import 'package:flutter/material.dart';
import 'package:samayam/const/textstyle.dart';

class Settinglisttile extends StatelessWidget {
  const Settinglisttile({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: kcartliststyle,
      ),
    );
  }
}
