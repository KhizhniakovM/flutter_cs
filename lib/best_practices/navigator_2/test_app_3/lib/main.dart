import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: MyRouterDelegate(),
      ),
    );
  }
}

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  int selectedIndex = 0;
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Navigator 2.0 - Animations',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onTap: onNewIndexSelected,
      ),
      body: Navigator(
        key: navigatorKey,
        observers: [
          HeroController()
        ], // Important to ensure that hero animations are displayed
        pages: [
          if (selectedIndex == 0)
            MyPage(
              key: ValueKey('ProfilePage'),
              child: ProfileWidget(
                onPressed: () {},
              ),
            ),
          if (selectedIndex == 1)
            MyPage(
              key: ValueKey('NestedNavigatorPage'),
              child: SettingWidget(),
            ),
        ],
        onPopPage: (route, result) {
          print('onPopPage NestedRouterDelegate');
          return false;
        },
      ),
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;

  void onNewIndexSelected(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}

class ProfileWidget extends StatelessWidget {
  final VoidCallback onPressed;

  ProfileWidget({required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: Hero(
            tag: 'redSquare',
            child: Container(
              height: 50,
              width: 50,
              color: Colors.redAccent,
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(50.0),
            color: Colors.amberAccent,
            child: Text('Your profile'),
          ),
        ),
      ],
    );
  }
}

class SettingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Hero(
            tag: 'redSquare',
            child: Container(
              height: 50,
              width: 50,
              color: Colors.redAccent,
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(50.0),
            color: Colors.greenAccent,
            child: Text(
              'Your settings',
            ),
          ),
        ),
      ],
    );
  }
}

class MyPage extends Page {
  final Widget child;

  MyPage({required this.child, required LocalKey key}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
