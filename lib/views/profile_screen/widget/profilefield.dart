import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';

class Profilefield extends StatelessWidget {
  const Profilefield({Key? key, required this.data}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kctransperant),
      height: 50,
      width: 350,
      child: Center(
          child: Text(
        data,
        style: kcartliststyle,
      )),
    );
  }
}
