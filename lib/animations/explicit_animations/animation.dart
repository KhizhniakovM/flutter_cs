  // import 'package:flutter/material.dart';
  // Также можно использовать tweens и переводить их в анимацию при работе с animation controller 

  // main() {
  // AnimationController _controller = AnimationController(vsync: this);
  // Tween<double> tweenDouble = Tween<double>(begin: 0, end: 300);
  // ColorTween tweenColor = ColorTween(begin: Colors.red, end: Colors.green);

  // Animation<double> doubleAnimation;
  // Animation<Color> colorAnimation;

  // doubleAnimation = tweenDouble.animate(_controller);
  // colorAnimation = tweenColor.animate(_controller);

  // и в дереве виджетов уже используем:
  // doubleAnimation.value 
  // colorAnimation.value 
  // }