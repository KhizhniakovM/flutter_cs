import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 50),
      child: RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w900,
                  fontSize: 44,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: 'Inspire'),
                TextSpan(text: '.', style: TextStyle(color: Colors.red))
              ])),
    );
  }
}
