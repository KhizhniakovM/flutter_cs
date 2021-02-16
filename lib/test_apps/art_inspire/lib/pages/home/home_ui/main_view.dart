import 'package:art_inspire/pages/home/home_ui/home_ui.dart';
import 'package:art_inspire/pages/home/home_ui/main_list_view.dart';
import 'package:art_inspire/pages/home/home_ui/theme_buttons.dart';
import 'package:flutter/material.dart';
import 'main_logo.dart';

class MainView extends StatefulWidget {
  MainView({
    Key? key,
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // TODO: - take elements from network
  List items = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black12,
        child: ListView(
          children: [
            MainLogo(),
            ThemeButtons(),
            MainListView(
              items: items,
            )
          ],
        ));
  }
}
