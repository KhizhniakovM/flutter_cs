import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final SomeClass someClass = SomeClass();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: MyWidget(someClass)),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final SomeClass someClass;
  final TextEditingController _controller = TextEditingController();

  MyWidget(this.someClass);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
          child: TextField(
            controller: _controller,
            key: ValueKey('textfield'),
            onChanged: (text) {
              if (text == 'I find it') {
                _controller.text = 'abc';
              }
            },
          ),
        ),
        TextButton(onPressed: () {}, child: Text('Button'))
      ],
    );
  }
}

class SomeClass {
  int makeSth() => 5;
}
