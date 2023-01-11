import 'package:flutter/material.dart';
import 'package:samayam/const/colours.dart';

class Mysplashpaint extends StatelessWidget {
  const Mysplashpaint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: Mypaint1(),
          child: Container(),
        ),
        CustomPaint(
          painter: Mypaint(),
          child: Container(),
        ),
      ],
    );
  }
}

class Mypaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.color = kbodycolor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.20,
      size.width * 0.3,
      size.height * 0.10,
    );
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.25,
      size.width * 0.8,
      size.height * 0.35,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.20,
      size.width * 1,
      size.height * 0.1,
    );
    path.lineTo(size.width, size.height * 0);
    path.lineTo(0, size.height * 0);
    path.lineTo(0, size.height * 0.0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class Mypaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.color = kbodycolor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.78,
      size.width * 0.3,
      size.height * 0.89,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.95,
      size.width * 0.6,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.75,
      size.width * 0.85,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.65,
      size.width,
      size.height * 0.68,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
