import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/problems/leet_code_linked_list.dart';
import 'package:flutter_cs/data_structures/linked_list/singly_linked_list_node.dart'
    as SLL;

void main() {
  group('reverse linked list', () {
    SLL.Node<int>? node1 = SLL.Node<int>(1);
    SLL.Node<int>? node2 = SLL.Node<int>(2);
    SLL.Node<int>? node3 = SLL.Node<int>(3);
    SLL.Node<int>? node4 = SLL.Node<int>(4);
    SLL.Node<int>? node5 = SLL.Node<int>(5);
    setUp(() {
      node1.setNext(node2);
      node2.setNext(node3);
      node3.setNext(node4);
      node4.setNext(node5);
    });

    test('reverse', () {
      SLL.Node<int>? result = reverseLinkedList(node1);

      expect(result.toString(), '5, 4, 3, 2, 1');
    });
  });
}
