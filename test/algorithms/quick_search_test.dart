import 'package:flutter_cs/algorithms/quick_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO: - Make more tests
  test('try quick search', () {
    List list = [20,22,24,26,27,2,4,6,8,10,12,14,16,18];
    int result = quickSearch(list, 4);

    expect(result, 10);
  });
}