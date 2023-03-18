import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/textstyle.dart';

class Checkoutbox extends StatelessWidget {
  const Checkoutbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kctransperant.withOpacity(0.9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Total Cost',
                style: kcartliststyle,
              ),
              Text(
                '100499',
                style: kcartliststyle,
              )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Checkout"))
        ],
      ),
    );
  }
}
