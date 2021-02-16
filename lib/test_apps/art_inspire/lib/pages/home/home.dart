import 'package:flutter/material.dart';
import 'home_ui/home_ui.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [MainView(), MainTabBar()]),
    );
  }
}
