import 'package:flutter_cs/algorithms/counting_sort.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  List<int> list = [1,2,3,4,2,3,1,0,1,2,0,1,2,3,1,0];

  test('counting sort', () {
    List<int> result = countingSort(list);

    expect(result, [0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,4]);
  });
}