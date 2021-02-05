import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/algorithms/simple/selection_sort.dart';

void main() {
  test('selection sort', () {
    List list = [1,4,7,2,3,9,5];
    List result = selectionSort(list);
    
    expect(result, [1,2,3,4,5,7,9]);
  });
  test('selection sort for empty list', () {
    List list = [];
    List result = selectionSort(list);
    
    expect(result, []);
  });
  test('selection sort for 1 element list', () {
    List list = [5];
    List result = selectionSort(list);
    
    expect(result, [5]);
  });
}