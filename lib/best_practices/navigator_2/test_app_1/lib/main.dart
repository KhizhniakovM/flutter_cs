import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyHomeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  MyHomeWidget({@required this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0 101 - Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.greenAccent,
                child: Text('Click me to navigate.'),
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

class MyOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0 101 - Other page'),
      ),
      body: Center(
        child: Text('You did it!'),
      ),
    );
  }
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