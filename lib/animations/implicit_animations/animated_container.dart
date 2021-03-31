import 'package:flutter/material.dart';
import 'package:flutter_cs/animations/curves.dart';

void main() => runApp(MyApp());

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
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          curve: CustomCurve(),
          left: _left,
          top: 100,
          child: SomeOtherWidget(),
          duration: Duration(seconds: 1),
        ),
        updateStateButton(),
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
              if (_left > 0) {
                _left = 0;
              } else {
                _left = 300;
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
      color: Colors.blue,
      width: 200,
      height: 200,
    );
  }
}
