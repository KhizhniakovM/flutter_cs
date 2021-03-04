import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (_) => AuthenticationBloc(),
      child: MaterialApp(
        home: Router(
          routerDelegate: MyRouterDelegate(),
        ),
      ),
    );
  }
}

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  bool showOtherPage = false;
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authenticationState) {
        return Navigator(
          key: navigatorKey,
          pages: [
            MaterialPage(
              key: ValueKey('MyConnectionPage'),
              child: MyConnexionWidget(),
            ),
            if (authenticationState is AuthenticatedState)
              MaterialPage(
                key: ValueKey('MyHomePage'),
                child: MyHomeWidget(),
              ),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            BlocProvider.of<AuthenticationBloc>(context).add(UserLogoutEvent());
            return true;
          },
        );
      },
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

class MyConnexionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0 101 - Connexion screen'),
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
              onPressed: () =>
                  BlocProvider.of<AuthenticationBloc>(context).add(UserLoginEvent()),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0 101 - Home screen'),
      ),
      body: Center(
        child: Text('You are connected!'),
      ),
    );
  }
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(UnauthenticatedState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    switch (event.runtimeType) {
      case UserLoginEvent:
        yield AuthenticatedState();
        break;
      case UserLogoutEvent:
        yield UnauthenticatedState();
        break;
    }
  }
}

// Authentication events
abstract class AuthenticationEvent {}
class UserLogoutEvent extends AuthenticationEvent {}
class UserLoginEvent extends AuthenticationEvent {}

// Authentication states
abstract class AuthenticationState {}
class UnauthenticatedState extends AuthenticationState {}
class AuthenticatedState extends AuthenticationState {}