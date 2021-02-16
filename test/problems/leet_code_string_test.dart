import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/problems/leet_code_string.dart';
void main() {
  group('reverse string', () {
    test('hello world', () {
      String input = 'Hello world!';
      String output = reverseString(input);

      expect(output, '!dlrow olleH');
    });
  });
}