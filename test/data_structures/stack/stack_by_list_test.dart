import 'package:flutter_cs/data_structures/stack/stack_by_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // MARK: - Properties
  Stack? stack;
  // MARK: - SetUp & TearDown
  setUp(() {
    stack = Stack<int>();
  });
  tearDown((){
    stack = null;
  });
  // MARK: - Test
  test('create empty stack', () {
    expect(stack?.isEmpty, true);
  });
  test('push element', () {
    stack?.push(5);
    stack?.push(9);

    expect(stack?.isEmpty, false);
    expect(stack?.length, 2);
    expect(stack?.peek, 9);
  });
  test('pop element', () {
    stack?.push(-5);
    stack?.push(-100);
    stack?.pop();

    expect(stack?.isEmpty, false);
    expect(stack?.peek, -5);
    expect(stack?.length, 1);
  });
  test('pop many times', () {
    stack?.push(-3245);
    stack?.pop();
    stack?.pop();

    expect(stack?.isEmpty, true);
    expect(stack?.peek, null);
    expect(stack?.length, 0);
  });
}