import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';

class Myappbar extends StatelessWidget {
  const Myappbar({Key? key, this.title, required this.appbartrailing})
      : super(key: key);
  final Widget? title;
  final Widget appbartrailing;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kappbarcolor,
      title: title,
      centerTitle: true,
      toolbarHeight: 60,
      actions: [appbartrailing],
    );
  }
}
