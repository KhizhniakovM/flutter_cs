import 'dart:math';
import 'package:flutter_cs/problems/sth/experiments.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<int> list;
  late int result;

  Stopwatch stopwatch = Stopwatch();

  Iterable<int> makeList(int count) sync* {
    for (int i = 0; i < count; i++) {
      yield Random().nextInt(count);      
    }
  }

  setUpAll(() {
    stopwatch.start();
    list = makeList(100000).toList();
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
  test('Set', () async {
    result = await findCountOfSimilarNumbersSet(list);
  });
  test('Sort', () async {
    result = await findCountOfSimilarNumbersSort(list);
  });
}