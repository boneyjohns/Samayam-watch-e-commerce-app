import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/controller/search_controller.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Mysearch extends StatelessWidget {
  Mysearch({
    super.key,
  });
  final search = TextEditingController();
  final c = Get.put(Searchcontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Searchcontroller>(builder: (c) {
      return SearchBarAnimation(
        textEditingController: search,
        isOriginalAnimation: false,
        trailingWidget: const Icon(Icons.search),
        secondaryButtonWidget: const Icon(Icons.close),
        buttonWidget: const Icon(Icons.search),
        buttonColour: kblue,
        buttonShadowColour: kred,
        durationInMilliSeconds: 1000,
        onChanged: (val) {
          c.search(val);
        },
      );
    });
  }
}
