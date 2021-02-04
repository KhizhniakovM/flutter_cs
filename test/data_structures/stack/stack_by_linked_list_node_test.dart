import 'package:flutter_cs/data_structures/stack/stack_by_linked_list_node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // MARK: - Properties
  StackByLinkedListNode? stack;
  // MARK: - SetUp & TearDown
  setUp(() {
    stack = StackByLinkedListNode<int>();
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
    expect(stack?.lenght, 2);
    expect(stack?.peek, 9);
  });
  test('pop element', () {
    stack?.push(-5);
    stack?.push(-100);
    stack?.pop();

    expect(stack?.isEmpty, false);
    expect(stack?.peek, -5);
    expect(stack?.lenght, 1);
  });
  test('pop many times', () {
    stack?.push(-3245);
    stack?.pop();
    stack?.pop();

    expect(stack?.isEmpty, true);
    expect(stack?.peek, null);
    expect(stack?.lenght, 0);
  });
}