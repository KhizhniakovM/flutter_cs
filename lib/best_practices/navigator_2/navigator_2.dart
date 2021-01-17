import 'package:flutter/material.dart';

class NavigatorApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
    );
  }
}
// ==================================================
// MARK: - AppPath
class AppPath {
  final String _path;
  String get path => _path;

  AppPath.home() : _path = "";
  AppPath.details() : _path = "/details";
  AppPath.unknown() : _path = "/404";
}

// ==================================================
// MARK: - RouterDelegate
class MyRouterDelegate extends RouterDelegate<AppPath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPath> {
  @override
  void addListener(listener) {

  }
  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }
  @override
  Future<bool> popRoute() {

    throw UnimplementedError();
  }
  @override
  void removeListener(listener) {

  }
  @override
  Future<void> setNewRoutePath(AppPath configuration) {
    throw UnimplementedError();
  }
  @override
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();
}

// ==================================================
// MARK: - RouteInformationParser
class MyRouteInformationParser extends RouteInformationParser<AppPath> {
  @override
  Future<AppPath> parseRouteInformation(RouteInformation routeInformation) {
    throw UnimplementedError();
  }

}