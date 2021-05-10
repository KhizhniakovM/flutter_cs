import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Universal {
  static StatefulWidget app(
      {Widget? home,
      Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
      String? initialRoute,
      CupertinoThemeData? cupertinoThemeData,
      ThemeData? themeData}) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: home,
        onGenerateRoute: onGenerateRoute,
        initialRoute: initialRoute,
        theme: cupertinoThemeData,
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home,
        onGenerateRoute: onGenerateRoute,
        initialRoute: initialRoute,
        theme: themeData,
      );
    }
  }

  static Widget button(
      {required Widget child, required void Function()? onPressed}) {
    if (Platform.isIOS) {
      return CupertinoButton(child: child, onPressed: onPressed);
    } else {
      return TextButton(child: child, onPressed: onPressed);
    }
  }

  static PageRoute route(
      {required WidgetBuilder builder, RouteSettings? settings}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder, settings: settings);
    } else {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
  }

  static Widget scaffold(
      {required Widget child,
      AppBar? materialAppBar,
      CupertinoNavigationBar? cupertinoNavigationBar,
      Color? backgroundColor}) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: SafeArea(
            child: Scaffold(
          body: child,
          backgroundColor: backgroundColor ?? Colors.white,
        )),
        navigationBar: cupertinoNavigationBar,
        backgroundColor: backgroundColor ?? Colors.white,
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: materialAppBar,
          body: child,
          backgroundColor: backgroundColor ?? Colors.white,
        ),
      );
    }
  }

  static Widget checkbox(
      {required bool value, required void Function(bool?)? onChanged}) {
    if (Platform.isIOS) {
      return CupertinoSwitch(value: value, onChanged: onChanged);
    } else {
      return Checkbox(value: value, onChanged: onChanged);
    }
  }
}
