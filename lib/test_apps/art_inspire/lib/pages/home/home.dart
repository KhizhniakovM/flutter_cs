import 'package:flutter/material.dart';
import 'home_ui/home_ui.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [HomeView(), HomeTabBar()]),
      ),
    );
  }
}
