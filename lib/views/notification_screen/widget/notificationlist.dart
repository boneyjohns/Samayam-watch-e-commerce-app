import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';
import 'package:samayam/const/const.dart';
import 'package:samayam/const/textstyle.dart';

class Notificationlist extends StatelessWidget {
  const Notificationlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kctransperant),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRlDRNGOzAquM1q0TTur-4wz_la8lExS6-BiSJJAvbMk2xIeC4_QSSm_DpPq0OMG4sI2BXG0-JaR85XDgfjaA3ZXL-dZRNTI0sS7fpaIZjhNpf9fhH7PuFBsA'),
          ),
          kwidth20,
          Text(
            'Your order is out for delivery',
            style: knotificationstyle,
          ),
          kwidth20
        ],
      ),
    );
  }
}
