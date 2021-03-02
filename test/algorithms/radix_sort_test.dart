import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/algorithms/radix_sort.dart';

void main() {
  List<int> list = [123,432,747,34,675,543,899,567,245,213,122,];
  test('radix sort test', () {
    radixSort(list, 3);
    
    expect(list, [34,122,123,213,245,432,543,567,675,747,899]);
  });
}