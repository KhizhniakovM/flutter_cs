import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cs/best_practices/navigation/with_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, Object> arguments =
        settings.arguments as Map<String, Object>;
    if (Platform.isIOS) {
      switch (settings.name) {
        case '/':
          return CupertinoPageRoute(builder: (context) => Home());
        case '/details':
          return CupertinoPageRoute(
              builder: (context) => Details(
                  passedString: arguments['passedString'] as String,
                  callBack: arguments['passedMethod'] as Function));
        default:
          return CupertinoPageRoute(builder: (context) => Home());
      }
    }
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/details':
        return MaterialPageRoute(
            builder: (context) => Details(
                passedString: arguments['passedString'] as String,
                callBack: arguments['passedMethod'] as Function));
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }

//   static Route<dynamic> _errorRoute() {
//     if (Platform.isIOS) {
//       return CupertinoPageRoute(builder: (context) => );
//     }
//     return MaterialPageRoute(builder: (context) => );
//   }
}
