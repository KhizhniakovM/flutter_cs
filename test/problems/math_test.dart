import 'package:flutter_cs/problems/math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
    // ==================================================
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
// NOTE: - We can add this options to method.
    test('exp with negative power 1', () {
      double result = exponentiation(base: 3, power: -1);
      double expected = 1 / 3;
      expect(result, expected);
    });
    test('exp with negative power', () {
      double result = exponentiation(base: 3, power: -3);
      double expected = 1 / 27;
      expect(result, expected);
    });
  });

  group('prime', () {
    test('prime true', () {
      bool result = isPrime(5);
      expect(result, true);
    });
    test('prime false', () {
      bool result = isPrime(6);
      expect(result, false);
    });
    test('prime negative', () {
      bool result = isPrime(-5);
      expect(result, false);
    });
  });

  group('count of prime', () {
    test('count of prime', () {
      int result = countOfPrimeNumbersUntil(10000);
      expect(result, 1229);
    });
    test('count of prime', () {
      int result = countOfPrimeNumbersUntil(2);
      expect(result, 1);
    });
  });
}
