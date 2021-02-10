import 'package:flutter_cs/algorithms/simple/insertion_sort.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('insertion sort', () {
    List list = [1,4,7,2,3,9,5];
    insertionSort(list);
    
    expect(list, [1,2,3,4,5,7,9]);
  });
  test('insertion sort for empty list', () {
    List list = [];
    insertionSort(list);
    
    expect(list, []);
  });
  test('insertion sort for 1 element list', () {
    List list = [5];
    insertionSort(list);
    
    expect(list, [5]);
  });
}