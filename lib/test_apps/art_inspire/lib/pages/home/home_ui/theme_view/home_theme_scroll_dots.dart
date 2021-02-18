import 'package:art_inspire/pages/home/home_ui/home_ui.dart';
import 'package:art_inspire/pages/home/home_ui/painters/one_dash_icon.dart';
import 'package:art_inspire/pages/home/home_ui/painters/one_dot_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeThemeScrollDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.watch<HomeTheme>().count,
          itemBuilder: (context, position) {
            if (position == context.read<HomeTheme>().choosedView) {
              return OneDashIcon();
            } else {
              return OneDotIcon(
                color: Colors.black26,
                strokeWidth: 7.5,
                width: 15,
                height: 12,
              );
            }
          }),
    );
  }
}
