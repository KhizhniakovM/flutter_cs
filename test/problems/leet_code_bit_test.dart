import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/problems/leet_code_bit.dart';

void main() {
  List<int> list = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,9];

  test('test single number', () {
    int result = singleNumber(list);

    expect(result, 8);
  });
}