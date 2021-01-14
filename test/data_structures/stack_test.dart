import 'package:flutter_cs/data_structures/stack.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('create stack', () {
    Stack<int> stack = Stack<int>();
    bool isEmpty = true;
    expect(stack.isEmpty, isEmpty);
  });

}
