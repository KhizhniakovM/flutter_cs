import 'package:flutter_test/flutter_test.dart';

// We need to use equatable to compare equal instances.

void main() {
  int? number;

  setUp(() {
    number = 5;
  }); // Run before each test will run. We can instantiate sth in it.

  tearDown(() {
    number = null; 
  }); // Run after each test will run.

  test('', () {
    
  });
}