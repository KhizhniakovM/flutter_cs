import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:my_app/router/route_generator.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/auth',
    );
  }
}
