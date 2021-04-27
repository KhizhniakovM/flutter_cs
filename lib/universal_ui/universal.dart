import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Universal {
  static StatefulWidget app(
      {Widget? home,
      Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
      String? initialRoute}) {
    if (Platform.isIOS) {
      return CupertinoApp(
        home: home,
        onGenerateRoute: onGenerateRoute,
        initialRoute: initialRoute,
      );
    }
    return MaterialApp(
      home: home,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
    );
  }

  static Widget button({required Widget child, required void Function()? onPressed}) {
    if (Platform.isIOS) {
      return CupertinoButton(child: child, onPressed: onPressed);
    }
    return TextButton(child: child, onPressed: onPressed);
  }

  static PageRoute route({required WidgetBuilder builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }

  static Widget scaffold({required Widget child}) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: child);
    }
    return Scaffold(
      body: child,
    );
  }
}
