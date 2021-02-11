import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class UniversalApp extends StatelessWidget {
  final Widget? home;
  final RouteFactory? onGenerateRoute;
  final String? initialRoute;

  const UniversalApp({Key? key, this.home, this.onGenerateRoute, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(home: home, onGenerateRoute: onGenerateRoute, initialRoute: initialRoute,);
    } 
    return MaterialApp(home: home, onGenerateRoute: onGenerateRoute, initialRoute: initialRoute,);
  }
}