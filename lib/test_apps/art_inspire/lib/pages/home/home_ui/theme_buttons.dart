import 'package:art_inspire/pages/home/home_ui/theme_point.dart';
import 'package:flutter/material.dart';

class ThemeButtons extends StatelessWidget {
  Function? chooseMethod;
  final List<String> list = ['Pop Art', 'Geometric', 'Nature'];

  ThemeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  chooseMethod = () {

  };

    return Container(
        padding: const EdgeInsets.only(left: 50),
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, position) =>
                ThemePoint(text: list[position], chooseMethod: chooseMethod!,)));
  }
}