import 'package:flutter/material.dart';
import 'package:testing_app/widget.dart';
void main() => runApp(MyApp());

int sum(int a, int b) => a + b;

double divide(int a, int b) {
  if (b == 0) throw ArgumentError("You can't divide on zero");
  return a / b;
}

Future<double> powerOfTwo(double a) {
  return Future.delayed(const Duration(seconds: 1), () => a * a);
}

Stream<double> pi() {
  return Stream.fromIterable([3, 3.1, 3.14, 3.141, 3.1415]);
}
