import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/algorithms/simple/bubble_sort.dart';

void main() {
  test('bubble sort', () {
    List list = [1,4,7,2,3,9,5];
    bubbleSort(list);
    
    expect(list, [1,2,3,4,5,7,9]);
  });
  test('bubble sort for empty list', () {
    List list = [];
    bubbleSort(list);
    
    expect(list, []);
  });
  test('bubble sort for 1 element list', () {
    List list = [5];
    bubbleSort(list);
    
    expect(list, [5]);
  });
}