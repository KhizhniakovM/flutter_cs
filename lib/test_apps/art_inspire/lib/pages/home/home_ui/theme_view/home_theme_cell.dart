import 'package:flutter/material.dart';

class HomeThemeCell extends StatelessWidget {
  final String? artistName;
  final String? artistWork;
  final String? worksCount;
  final String? rating;
  final Color color;

  const HomeThemeCell(
      {Key? key,
      this.artistName,
      this.artistWork,
      this.rating,
      this.worksCount, 
      required this.color})
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
              color: this.color,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  bottomLeft: const Radius.circular(25))),
        ),
        SizedBox(height: 10),
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
