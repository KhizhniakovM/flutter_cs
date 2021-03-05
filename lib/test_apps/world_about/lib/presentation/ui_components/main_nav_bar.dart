import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const MainBottomNavigationBar(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Books'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Discover')
      ],
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }
}