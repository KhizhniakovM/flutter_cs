import 'package:flutter/material.dart';

// Animated builder
// Animation widget

// Always you need to incapsulate your animation builder
// into your custom transition that extends animation widget

class CustomTransition extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  CustomTransition({Key? key, required this.animation, required this.child})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, childWidget) {
        return ClipOval(child: child,); // For example
      },
      child: child,
    );
  }
}
