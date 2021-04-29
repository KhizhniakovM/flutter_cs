import 'package:flutter/widgets.dart';
import 'package:my_app/helpers/universal.dart';
import 'package:my_app/screens/pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case '/auth':
        return Universal.route(builder: (context) => AuthPage());
      case '/':
        return Universal.route(builder: (context) => HomePage());
      // case '/details':
      //   return Universal.route(
      //       builder: (context) => DetailsPage(
      //           passedString: arguments?['passedString'] as String));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() =>
      Universal.route(builder: (context) => HomePage());
}
