import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_test/helpers/universal.dart';
import 'package:sqlite_test/router/route_generator.dart';

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Universal.app(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
        cupertinoThemeData: _cupertinoThemeData(),
        themeData: _themeData());
  }

  ThemeData _themeData() {
    return ThemeData(scaffoldBackgroundColor: Colors.white);
  }
  CupertinoThemeData _cupertinoThemeData() {
    return CupertinoThemeData(scaffoldBackgroundColor:  Colors.white);
  }
}
