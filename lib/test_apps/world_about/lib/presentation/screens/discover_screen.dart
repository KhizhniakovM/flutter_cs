import 'package:flutter/material.dart';

class DiscoverRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: DiscoverRouterDelegate(),
    );
  }
}

class DiscoverRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  int _currentPage = 0;

  GlobalKey<NavigatorState> _navigatorKey;
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  DiscoverRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: DiscoverScreen(toDiscoverTwo: _toDiscoverTwo)),
        if (_currentPage == 1)
          MaterialPage(
              child: DiscoverSecondScreen(toDiscoverOne: _toDiscoverThree)),
        if (_currentPage == 2) ...[
          MaterialPage(
              child: DiscoverSecondScreen(toDiscoverOne: _toDiscoverThree)),
          MaterialPage(
              child: DiscoverThirdScreen(toDiscoverOne: _toDiscoverOne))
        ]
      ],
      onPopPage: (route, result) => true,
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }

  void _toDiscoverThree() {
    _currentPage = 2;
    notifyListeners();
  }

  void _toDiscoverTwo() {
    _currentPage = 1;
    notifyListeners();
  }

  void _toDiscoverOne() {
    _currentPage = 0;
    notifyListeners();
  }
}

class DiscoverScreen extends StatelessWidget {
  final Function toDiscoverTwo;

  const DiscoverScreen({Key? key, required this.toDiscoverTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: _makeButton()),
    );
  }

  Widget _makeButton() {
    return TextButton(onPressed: _onPressed, child: Text('To Discover 2'));
  }

  void _onPressed() => toDiscoverTwo();
}

class DiscoverSecondScreen extends StatelessWidget {
  final Function toDiscoverOne;

  const DiscoverSecondScreen({Key? key, required this.toDiscoverOne})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Center(child: _makeButton()),
    );
  }

  Widget _makeButton() {
    return TextButton(onPressed: _onPressed, child: Text('To Discover 3'));
  }

  void _onPressed() => toDiscoverOne();
}

class DiscoverThirdScreen extends StatelessWidget {
  final Function toDiscoverOne;

  const DiscoverThirdScreen({Key? key, required this.toDiscoverOne})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: _makeButton()),
    );
  }

  Widget _makeButton() {
    return TextButton(onPressed: _onPressed, child: Text('To Discover 1'));
  }

  void _onPressed() => toDiscoverOne();
}
