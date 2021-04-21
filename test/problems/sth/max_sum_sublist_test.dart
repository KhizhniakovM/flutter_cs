import 'dart:math';

import 'package:flutter_cs/problems/sth/max_sum_sublist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<int> list;
  late int result;

  Stopwatch stopwatch = Stopwatch();

  Iterable<int> makeList(int count) sync* {
    for (int i = 0; i < count; i++) {
      bool isNegative = Random().nextBool();
      int number = Random().nextInt(count);

      if (isNegative) {
        yield -number;
      } else {
        yield number;
      }
    }
  }

  setUpAll(() {
    stopwatch.start();
    list = makeList(1000).toList();
    print('time of creating list is - ${stopwatch.elapsedMilliseconds}');
    stopwatch.stop();
    stopwatch.reset();
  });
  setUp(() {
    stopwatch.start();
  });
  tearDown(() {
    print('result is - $result');
    print('time is - ${stopwatch.elapsedMilliseconds}');
    stopwatch.stop();
    stopwatch.reset();
  });

  test('1 solution', () async {
    result = await findMaxSum1(list);
  });
  test('2 solution', () async {
    result = await findMaxSum2(list);
  });
  test('3 solution', () async {
    result = await findMaxSum3(list);
  });
}
