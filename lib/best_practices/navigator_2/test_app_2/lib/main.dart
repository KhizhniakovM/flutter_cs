import 'package:flutter/material.dart';
// import 'package:move_to_background/move_to_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: AuthenticationRouterDelegate(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}

class AuthenticationRouterDelegate extends RouterDelegate with ChangeNotifier {
  bool isAuthenticated = false;
  final GlobalKey<NavigatorState> navigatorKey;

  AuthenticationRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<bool> popRoute() async {
    print('popRoute AuthenticationRouterDelegate');
    // MoveToBackground.moveTaskToBack();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [HeroController()],
      pages: [
        MaterialPage(
          key: ValueKey('MyHomePage'),
          child: MyAuthenticationWidget(
            onPressed: () {
              isAuthenticated = true;
              notifyListeners();
            },
          ),
        ),
        if (isAuthenticated)
          MaterialPage(
            key: ValueKey('NestedNavigatorPage'),
            child: NestedRouterWidget(),
          ),
      ],
      onPopPage: (route, result) {
        print('onPopPage AuthenticationRouterDelegate');
        if (!route.didPop(result)) return false;

        isAuthenticated = false;
        notifyListeners();
        return true;
      },
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

class MyAuthenticationWidget extends StatelessWidget {
  final VoidCallback onPressed;

  MyAuthenticationWidget({@required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are connected'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.greenAccent,
                child: Text('Click me to connect.'),
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

class NestedRouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final childBackButtonDispatcher = ChildBackButtonDispatcher(Router.of(context).backButtonDispatcher);
    childBackButtonDispatcher.takePriority();

    return Router(
      routerDelegate: NestedRouterDelegate(),
      backButtonDispatcher: childBackButtonDispatcher,
    );
  }
}

final GlobalKey<NavigatorState> _nestedNavigatorKey = GlobalKey<NavigatorState>();

class NestedRouterDelegate extends RouterDelegate with ChangeNotifier {
  int selectedIndex = 0;

  @override
  Future<bool> popRoute() async {
    print('popRoute NestedRouterDelegate');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are connected'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onTap: onNewIndexSelected,
      ),
      body: Navigator(
        key: _nestedNavigatorKey,
        observers: [HeroController()],
        pages: [
          if (selectedIndex == 0)
            MaterialPage(
              key: ValueKey('ProfilePage'),
              child: ProfileWidget(
                onPressed: () {},
              ),
            ),
          if (selectedIndex == 1)
            MaterialPage(
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

  ProfileWidget({@required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your profile'),
    );
  }
}

class SettingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Your settings'),
          TextButton(
            child: Container(color: Colors.redAccent, child: Icon(Icons.arrow_back_ios)),
            onPressed: () {
              return Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}