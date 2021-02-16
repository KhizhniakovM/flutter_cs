import 'dart:ui';

import 'package:flutter/material.dart';

class ThemePoint extends StatefulWidget {
  final String text;
  final Function chooseMethod;
  bool isChoosed = false;

  ThemePoint({Key? key, required this.text, required this.chooseMethod})
      : super(key: key);

  @override
  _ThemePointState createState() => _ThemePointState();
}

class _ThemePointState extends State<ThemePoint> {
  bool isChoosed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChoosed ? isChoosed = false : isChoosed = true;
        });

        widget.chooseMethod();
      },
      child: Container(
        padding: const EdgeInsets.only(right: 30),
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isChoosed ? CustomDotIcon() : SizedBox(),
            SizedBox(width: 5),
            Text(
              widget.text,
              style: isChoosed
                  ? TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black)
                  : TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDotIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 12,
        height: 12,
        child: CustomPaint(
          painter: DotPainter(),
        ));
  }
}

class DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 5;
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
