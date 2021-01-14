import 'package:flutter_cs/problems/math.dart';
import 'package:flutter_test/flutter_test.dart';

  group('lcd', () {
    test('lcd of 156 and 169 should be 13', () {
      int result = lcd(156, 169);
      expect(result, 13);
    });
    test('lcd with negative number or zero must return 1', () {
      int result = lcd(-156, 0);
      expect(result, 1);
    });
  });

  group('exp', () {
    test('exponentiation', () {
      double result = exponentiation(base: 5, power: 4);
      expect(result, 625);
    });
    test('exp with power 1', () {
      double result = exponentiation(base: 12, power: 1);
      expect(result, 12);
    });
    test('exp with base 1', () {
      double result = exponentiation(base: 1, power: 7);
      expect(result, 1);
    });
    test('exp with power 0', () {
      double result = exponentiation(base: 3, power: 0);
      expect(result, 1);
    });
    test('exp with negative power', () {
      double result = exponentiation(base: 3, power: -3);
      double expected = 1 / 27;
      expect(result, expected);
    });
    // NOTE: - We can add this options to method.
  });
