import 'dart:ui';
import 'package:flutter/material.dart';

class FourDotsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        width: 12,
        height: 12,
        child: CustomPaint(
          painter: FourDotsPainter(),
        ));
  }
}

class FourDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    List<Offset> points = [
      Offset(0, 0),
      Offset(size.width, 0),
      Offset(size.width, size.height),
      Offset(0, size.height),
    ];

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}