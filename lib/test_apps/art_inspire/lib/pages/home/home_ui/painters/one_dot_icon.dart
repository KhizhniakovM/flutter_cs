import 'dart:ui';
import 'package:flutter/material.dart';

class OneDotIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final double strokeWidth;

  OneDotIcon({Key? key, this.width, this.height, required this.color, required this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: this.height,
        child: CustomPaint(
          painter: OneDotPainter(color: this.color, strokeWidth: this.strokeWidth),
        ));
  }
}

class OneDotPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  OneDotPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = this.color;
    paint.strokeWidth = this.strokeWidth;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    List<Offset> points = [
      Offset(size.width / 2, size.height / 2),
    ];

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}