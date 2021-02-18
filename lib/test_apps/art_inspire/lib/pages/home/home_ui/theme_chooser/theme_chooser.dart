import 'package:art_inspire/pages/home/home_ui/theme_chooser/theme_button.dart';
import 'package:flutter/material.dart';

class HomeThemeChooser extends StatelessWidget {
  final List<String> list = ['Pop Art', 'Geometric', 'Nature'];

  HomeThemeChooser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 50),
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, position) =>
                ThemeButton(text: list[position])));
  }
}
