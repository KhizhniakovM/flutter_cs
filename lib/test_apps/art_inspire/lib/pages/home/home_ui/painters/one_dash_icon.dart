import 'package:flutter/material.dart';

class OneDashIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 35,
        height: 12,
        child: CustomPaint(
          painter: OneDashPainter(),
        ));
  }
}

class OneDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 7.5;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    Offset p1 = Offset(size.width / 4, size.height / 2);
    Offset p2 = Offset(size.width * (3 / 4), size.height / 2);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}