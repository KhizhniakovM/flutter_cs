import 'package:flutter/material.dart';
import 'package:world_about/presentation/screens/books_screen.dart';
import 'package:world_about/presentation/screens/discover_screen.dart';
import 'package:world_about/presentation/ui_components/main_nav_bar.dart';

class MainRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  int _currentIndex = 0;

  final GlobalKey<NavigatorState> _navigatorKey;
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  MainRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
      ),
      body: Navigator(pages: [
        if (_currentIndex == 0) MaterialPage(child: BooksScreen()),
        if (_currentIndex == 1) MaterialPage(child: DiscoverRouter()),
      ], onPopPage: (route, result) => true),
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }

  void _onTap(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
