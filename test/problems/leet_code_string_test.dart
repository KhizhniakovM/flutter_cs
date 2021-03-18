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
  group('isAnagram', () {
    test('1', () {
      String first = 'helloworld';
      String second = 'worldhello';
      bool result = isAnagram(first, second);

      expect(result, true);
    });
    test('2', () {
      String first = 'abbb';
      String second = 'aabb';
      bool result = isAnagram(first, second);

      expect(result, false);
    });
  });
}
