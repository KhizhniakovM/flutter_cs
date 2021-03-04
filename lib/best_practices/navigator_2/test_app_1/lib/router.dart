import 'package:flutter/material.dart';
import 'main.dart';

class MyRouterDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // MARK: - Properties
  bool showOtherPage = false;
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('MyHomePage'),
          child: MyHomeWidget(
            onPressed: () {
              showOtherPage = true;
              notifyListeners();
            },
          ),
        ),
        if (showOtherPage)
          MaterialPage(
            key: ValueKey('MyOtherPage'),
            child: MyOtherWidget(),
          ),
      ],
      onPopPage: (_, __) {
        showOtherPage = false;
        notifyListeners();
        return false;
      },
    );
  }
  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}