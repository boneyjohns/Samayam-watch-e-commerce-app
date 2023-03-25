import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/controller/searchcontroller.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class mysearch extends StatelessWidget {
  const mysearch({
    super.key,
    required this.searchcontroller,
  });

  final Searchcontroller searchcontroller;

  @override
  Widget build(BuildContext context) {
    return SearchBarAnimation(
      textEditingController: searchcontroller.textcontroller,
      isOriginalAnimation: false,
      trailingWidget: const Icon(Icons.search),
      secondaryButtonWidget: const Icon(Icons.close),
      buttonWidget: const Icon(Icons.search),
      buttonColour: kblue,
      buttonShadowColour: kred,
      durationInMilliSeconds: 1000,
      onChanged: (val) {
        searchcontroller.search(val);
      },
    );
  }
}
