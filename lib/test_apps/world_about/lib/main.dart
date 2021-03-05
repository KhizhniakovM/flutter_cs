import 'package:flutter/material.dart';
import 'package:world_about/router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: MainRouterDelegate(),
      ),
    );
  }
}
