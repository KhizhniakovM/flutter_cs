import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/problems/leet_code_others.dart';

void main() {
  List<int> list = [7, 7, 5, 7, 5, 1, 5, 7, 5, 5, 7, 7, 7, 7, 7, 7];
  List<int> listWithZeroes = [0, 7, 0, 7, 5, 1, 0, 7];
  test('majority number', () {
    int result = majorityElement(list);

    expect(result, 7);
  });

  test('move zeroes', () {
    moveZeroes(listWithZeroes);

    expect(listWithZeroes, [7, 7, 5, 1, 7, 0, 0, 0]);
  });

  group('roman to integer', () {
    test('1', () {
      String number = "XVIII";
      int result = romanToInteger(number);

      expect(result, 18);
    });
    test('2', () {
      String number = "CMLX";
      int result = romanToInteger(number);

      expect(result, 960);
    });
  });
  group('pascals triangle', () {
    test('1', () {
      List<List<int>> result = pascalsTriangle(5);

      expect(result, [
        [1],
        [1, 1],
        [1, 2, 1],
        [1, 3, 3, 1],
        [1, 4, 6, 4, 1]
      ]);
    });
    test('2', () {
      List<List<int>> result = pascalsTriangle(1);

      expect(result, [
        [1]
      ]);
    });
  });
}
