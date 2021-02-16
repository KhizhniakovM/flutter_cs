import 'dart:ui';

import 'package:flutter/material.dart';

class MainListView extends StatefulWidget {
  final List items;

  MainListView({
    Key? key, required this.items,
  }) : super(key: key);

  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  int _choosedView = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: Column(
          children: [
            Container(
              height: 320,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _choosedView = value;
                    });
                  },
                  itemCount: 5,
                  itemBuilder: (context, position) => MainListCell()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: CustomScrollDots(
                elementsCount: 5,
                choosedValue: _choosedView,
              ),
            )
          ],
        ));
  }
}

class MainListCell extends StatelessWidget {
  final String? artistName;
  final String? artistWork;
  final String? worksCount;
  final String? rating;

  const MainListCell(
      {Key? key,
      this.artistName,
      this.artistWork,
      this.rating,
      this.worksCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  bottomLeft: const Radius.circular(25))),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Jeremy Booth',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(children: [
                    Icon(Icons.star),
                    Text(
                      '4.95',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ]))
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('48 projects',
              style: TextStyle(
                  color: Colors.black26,
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        )
      ]),
    );
  }
}

class CustomScrollDots extends StatelessWidget {
  final int elementsCount;
  final int choosedValue;

  CustomScrollDots(
      {Key? key, required this.choosedValue, required this.elementsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: elementsCount,
          itemBuilder: (context, position) {
            if (position == choosedValue) {
              return CustomDash();
            } else {
              return CustomDot();
            }
          }),
    );
  }
}

class CustomDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 15,
        height: 12,
        child: CustomPaint(
          painter: DotPaint(),
        ));
  }
}

class DotPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black26;
    paint.strokeWidth = 7.5;
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

class CustomDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 35,
        height: 12,
        child: CustomPaint(
          painter: DashPaint(),
        ));
  }
}

class DashPaint extends CustomPainter {
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
