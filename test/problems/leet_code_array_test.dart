import 'package:flutter_cs/problems/leet_code_array.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('permutation', () {
    test('1', () {
      List<int> list = [1, 2, 3];
      Set<List<int>> result = permute(list);

      expect(result, {
        [1, 2, 3],
        [2, 1, 3],
        [1, 3, 2],
        [2, 3, 1],
        [3, 1, 2],
        [3, 2, 1]
      });
    });
  });
  group('max sublist of array', () {
    test('1', () {
      List<int> list = [
        13,
        -3,
        -25,
        20,
        -3,
        -16,
        -23,
        18,
        20,
        -7,
        12,
        -5,
        -22,
        15,
        -4,
        7,
      ];
      List<int> result = findMaxPartOfList(list);

      expect(result, [18,20,-7,12]);
    });
  });
}
