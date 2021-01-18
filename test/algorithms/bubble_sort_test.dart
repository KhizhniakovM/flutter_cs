import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/algorithms/bubble_sort.dart';

void main() {
  test('bubble sort', () {
    List list = [1,4,7,2,3,9,5];
    List result = bubbleSort(list);
    
    expect(result, [1,2,3,4,5,7,9]);
  });
  test('bubble sort for empty list', () {
    List list = [];
    List result = bubbleSort(list);
    
    expect(result, []);
  });
  test('bubble sort for 1 element list', () {
    List list = [5];
    List result = bubbleSort(list);
    
    expect(result, [5]);
  });
}