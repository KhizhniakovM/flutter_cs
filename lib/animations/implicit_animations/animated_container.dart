import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedContainerDemo(),
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  final _myDuration = Duration(milliseconds: 500);
  final _myValue = Color(0xFF00BB00);
  final _myNewValue = Color(0xFF0000FF);

  var _value = Color(0xFF00BB00);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedContainer(
            color: _value,
            duration: _myDuration,
            child: SomeOtherWidget(),
          ),
        ),
        updateStateButton()
      ],
    );
  }

  Align updateStateButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: ElevatedButton(
          child: Text('Update State'),
          onPressed: () {
            setState(() {
              if (_value == _myValue) {
                _value = _myNewValue;
              } else if (_value == _myNewValue) {
                _value = _myValue;
              }
            });
          },
        ),
      ),
    );
  }
}

class SomeOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
    );
  }
}
