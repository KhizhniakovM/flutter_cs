// Можно реализовать кастомный curve 

// https://www.desmos.com/calculator

import 'package:flutter/animation.dart';
import 'dart:math' as math;

class CustomCurve extends Curve {
  @override
  double transformInternal(double t) {
    final y = math.sin(t * 5 * math.pi * 2) * 0.5 + 0.5;
    return y;
  }
}