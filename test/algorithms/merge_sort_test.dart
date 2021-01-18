import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/algorithms/merge_sort.dart';
void main() {
  test('merge sort', () {
    List list = [1,4,7,2,3,9,5];
    List result = mergeSort(list);
    
    expect(result, [1,2,3,4,5,7,9]);
  });
  test('merge sort for empty list', () {
    List list = [];
    List result = mergeSort(list);
    
    expect(result, []);
  });
  test('merge sort for 1 element list', () {
    List list = [5];
    List result = mergeSort(list);
    
    expect(result, [5]);
  });
}