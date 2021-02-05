import 'package:flutter_cs/algorithms/simple/shell_sort.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('shell sort', () {
    List list = [1,4,7,2,3,9,5];
    List result = shellSort(list);
    
    expect(result, [1,2,3,4,5,7,9]);
  });
  test('shell sort for empty list', () {
    List list = [];
    List result = shellSort(list);
    
    expect(result, []);
  });
  test('shell sort for 1 element list', () {
    List list = [5];
    List result = shellSort(list);
    
    expect(result, [5]);
  });
}