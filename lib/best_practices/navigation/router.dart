import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cs/best_practices/navigation/with_routes.dart';
import 'package:flutter_cs/universal_ui/universal.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case '/':
        return Universal.route(builder: (context) => HomePage());
      case '/details':
        return Universal.route(
            builder: (context) => DetailsPage(
                passedString: arguments?['passedString'] as String));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() =>
      Universal.route(builder: (context) => HomePage());
}
