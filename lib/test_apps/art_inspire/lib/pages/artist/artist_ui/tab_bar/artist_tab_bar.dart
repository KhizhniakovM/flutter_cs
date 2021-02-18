import 'dart:ui';
import 'package:flutter/material.dart';

class ArtistTabBar extends StatelessWidget {
  const ArtistTabBar({
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
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '+',
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(Icons.mail_outline, color: Colors.black)
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
            width: 280,
            decoration: BoxDecoration(
                color: Color(0xFFFF3644),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.account_circle_outlined, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '235k',
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
