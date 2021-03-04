import 'package:flutter_cs/problems/leet_code_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('missing number', () {
    test('1', () {
      List<int> list = [1, 2, 3, 4, 5, 6, 0];
      int result = missingNumber(list);

      expect(result, 7);
    });
    test('2', () {
      List<int> list = [0];
      int result = missingNumber(list);

      expect(result, 1);
    });
  });

  group('duplicate number', () {
    test('1', () {
      List<int> list = [1, 2, 3, 4, 5, 5];
      int result = duplicateNumber(list);

      expect(result, 5);
    });
    test('2', () {
      List<int> list = [2, 2, 2, 2, 2];
      int result = duplicateNumber(list);

      expect(result, 2);
    });
  });
}
