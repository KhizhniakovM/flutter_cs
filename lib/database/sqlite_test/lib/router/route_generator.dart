import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_test/blocs/model_bloc/model_bloc.dart';
import 'package:sqlite_test/helpers/universal.dart';
import 'package:sqlite_test/pages/details/details_page.dart';
import 'package:sqlite_test/pages/home/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case '/':
        return Universal.route(builder: (context) => HomePage());
      case '/details':
        return Universal.route(
            builder: (context) => BlocProvider.value(
                  value: arguments?['bloc'] as ModelBloc,
                  child: DetailsPage(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() =>
      Universal.route(builder: (context) => HomePage());
}
