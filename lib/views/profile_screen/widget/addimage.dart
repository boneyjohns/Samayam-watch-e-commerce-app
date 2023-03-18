import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';

class Addimage extends StatelessWidget {
  const Addimage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CircleAvatar(
          maxRadius: 50,
          backgroundImage: NetworkImage(
              'https://imageio.forbes.com/specials-images/imageserve/63974b591dbcd3145c446ad4/Elon-Musk/1960x0.jpg?format=jpg&width=960'),
        ),
        Positioned(
            bottom: 0,
            right: 40,
            child: Icon(
              Icons.camera_alt_sharp,
              color: kred,
            )),
      ],
    );
  }
}
