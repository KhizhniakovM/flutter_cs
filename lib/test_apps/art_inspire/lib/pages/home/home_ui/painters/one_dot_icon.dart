import 'dart:ui';
import 'package:flutter/material.dart';

class OneDotIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final double strokeWidth;

  const OneDotIcon(
      {Key? key,
      this.width,
      this.height,
      required this.color,
      required this.strokeWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: OneDotPainter(color: color, strokeWidth: strokeWidth),
        ));
  }
}

class OneDotPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  OneDotPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = strokeWidth;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    final points = [
      Offset(size.width / 2, size.height / 2),
    ];

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
