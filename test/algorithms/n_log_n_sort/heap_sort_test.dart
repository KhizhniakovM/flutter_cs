import 'package:flutter_cs/algorithms/n_log_n_sort/heap_sort.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('heap sort', () {
    List list = [1,4,7,2,3,9,5];
    heapSort(list);
    
    expect(list, [1,2,3,4,5,7,9]);
  });
  test('heap sort for empty list', () {
    List list = [];
    heapSort(list);
    
    expect(list, []);
  });
  test('heap sort for 1 element list', () {
    List list = [5];
    heapSort(list);
    
    expect(list, [5]);
  });
}