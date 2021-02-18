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
}