import 'package:flutter/material.dart';

// Animation Controller
// Ticker

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: BouncingBall()),
    );
  }
}

class BouncingBall extends StatefulWidget {
  @override
  _BouncingBallState createState() => _BouncingBallState();
}

// We need to add ticker provider for state class of our animated widget
// Else we can use TickerProviderStateMixin if we need more than one animation controller
class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  static const _heightOfJump = 200;

  // Need to add animation controller, initialize it and dispose
  late AnimationController _controller;
  late Animation<Color?> _animation;

  // ==================================================
  final _colors = ColorTween(begin: Colors.green, end: Colors.red);
  // ==================================================

  @override
  void initState() {
    // Required vsync init with this.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // Need to add listeners, because our animation controller
    // doesn't know anything about the UI
    //```
    _controller.addListener(() {
      setState(() {});
    });
    //```
    // NOTE: - There we can add listener to status of our animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        print('reverse');
      }
    });
    // Need to control the repeating of our animation
// AnimationController provides several methods for “driving” an animation:
// repeat()
// forward()
// reverse()
// stop()
// reset()
    _controller.repeat(reverse: true);

// MARK: - We can work with tweens and animations
    _animation = _colors.animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // MARK: - We need use animation to change Color
          color: _animation.value,
        ),
        width: 75,
        height: 75,
        // We need to add controller.value to our changing value
        margin: EdgeInsets.only(bottom: _controller.value * _heightOfJump));
  }
}
