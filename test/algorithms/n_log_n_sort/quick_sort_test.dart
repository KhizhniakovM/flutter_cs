import 'package:flutter_cs/algorithms/n_log_n_sort/quick_sort.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('quick sort', () {
    List list = [1,4,7,2,3,9,5];
    quickSort(list, 0, list.length - 1);
    
    expect(list, [1,2,3,4,5,7,9]);
  });
  test('quick sort for empty list', () {
    List list = [];
    quickSort(list, 0, list.length - 1);
    
    expect(list, []);
  });
  test('quick sort for 1 element list', () {
    List list = [5];
    quickSort(list, 0, list.length - 1);
    
    expect(list, [5]);
  });
}