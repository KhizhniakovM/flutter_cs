import 'package:flutter_cs/problems/ya_practice/sprint_1.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Sprint1 sprint1 = Sprint1();

  group('a', () {
    test('1', () {
      int result = sprint1.a(-8, -5, -2, 7);

      expect(result, -183);
    });
    test('2', () {
      int result = sprint1.a(8, 2, 9, -10);

      expect(result, 40);
    });
  });

  group('b', () {
    test('1', () {
      List<int> result = sprint1.b([1, 2, 3, 1, 2, 3, 4], 3);

      expect(result, [1, 2, 3]);
    });
    test('2', () {
      List<int> result = sprint1.b([1, 1, 1, 2, 2, 3], 1);

      expect(result, [1]);
    });
    test('3', () {
      List<int> result = sprint1.b([1, 1, 1, 2, 2, 2], 1);

      expect(result, [1]);
    });
  });

  group('c', () {
    test('1', () {
      List<int> result = sprint1.c(4, [1, 2, 0, 0], 34);

      expect(result, [1, 2, 3, 4]);
    });
    test('2', () {
      List<int> result = sprint1.c(2, [9, 5], 17);

      expect(result, [1, 1, 2]);
    });
  });

  group('d', () {
    test('1', () {
      List<int> result = sprint1.d([-1, 0, 0, 1, 2, -1, -4, 0]);

      expect(result, [-1, 1, 2, -1, -4]);
    });
    test('2', () {
      List<int> result = sprint1.d([-1, 1, 2, -1, -4]);

      expect(result, [-1, 1, 2, -1, -4]);
    });
  });
}
