import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchcontroller extends GetxController {
  var name = '';
  late TextEditingController textcontroller;

  @override
  void onInit() {
    textcontroller = TextEditingController();
    super.onInit();
  }

  search(String value) {
    name = value;
  }
}
