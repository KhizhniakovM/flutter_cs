import 'package:flutter_cs/algorithms/simple/insertion_sort.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('insertion sort', () {
    List list = [1,4,7,2,3,9,5];
    List result = insertionSort(list);
    
    expect(result, [1,2,3,4,5,7,9]);
  });
  test('insertion sort for empty list', () {
    List list = [];
    List result = insertionSort(list);
    
    expect(result, []);
  });
  test('insertion sort for 1 element list', () {
    List list = [5];
    List result = insertionSort(list);
    
    expect(result, [5]);
  });
}