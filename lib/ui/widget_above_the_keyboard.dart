import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TestView(),
      ),
    );
  }
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(),
        ),
      ),
      LineAboveKeyboard()
    ]);
  }
}

class LineAboveKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isVisible) {
        if (isVisible)
          return Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.orange,
                height: 30,
                child: Placeholder(),
              ));
        else {
          return Container();
        }
      },
    );
  }
}
