import 'dart:ui';

import 'package:flutter/material.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TabBarButton(),
          Container(
              margin: const EdgeInsets.only(right: 25),
              height: 50,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.copy, color: Colors.black),
                  Icon(Icons.search, color: Colors.black),
                  Icon(Icons.account_circle_outlined, color: Colors.black)
                ],
              ))
        ],
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('hello world');
        },
        child: Container(
            margin: const EdgeInsets.only(left: 25),
            height: 60,
            width: 120,
            decoration: BoxDecoration(
                color: Color(0xFFFF3644),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomDotsIcon(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  )
                ])));
  }
}

class CustomDotsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        width: 12,
        height: 12,
        child: CustomPaint(
          painter: DotsPainter(),
        ));
  }
}

class DotsPainter extends CustomPainter {
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
