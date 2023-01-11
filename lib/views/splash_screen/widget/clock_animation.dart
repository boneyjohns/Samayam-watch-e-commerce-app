import 'package:flutter/material.dart';

class Clockanimation extends StatelessWidget {
  const Clockanimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 190,
      decoration: const BoxDecoration(
          image: DecorationImage(
              // image: AssetImage('lib/asset/spalshscreen.jfif'),
              image: NetworkImage(
                  'https://www.icegif.com/wp-content/uploads/icegif-5469.gif'))),
    );
  }
}
