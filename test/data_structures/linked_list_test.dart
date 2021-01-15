import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/data_structures/linked_list.dart';

void main() {
  // MARK: - Properties
  Node? node1;
  Node? node2;
  Node? node3;

  LinkedList? linkedList1;
  LinkedList? linkedList2;

  // MARK: - SetUp & TearDown
  setUp(() {
    node1 = Node<int>(1);
    node2 = Node<int>(2);
    node3 = Node<int>(3);
  });
  // MARK: - Node
  group('node', () {
    test('create node', () {
      expect(node1?.value, 1);
      expect(node1?.next, null);
      expect(node1?.previous, null);
    });
    test('node toString', () {
      String result = node1.toString();
      expect(result, '1');
    });
  });
  // MARK: - LinkedList
  group('linked list', () {
    setUp(() {
      linkedList1 = LinkedList<int>();
      linkedList2 = LinkedList<int>();
    });
    tearDown(() {
      linkedList1!();
      linkedList2!();
    });
    test('create linked list', () {
      expect(linkedList1?.lenght, 0);
      expect(linkedList1?.head, null);
      expect(linkedList1?.isEmpty, true);
      expect(linkedList1?.last, null);
    });
    test('append', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.appendNode(node2!);
      linkedList1?.appendNode(node3!);

      expect(linkedList1?.lenght, 3);
      expect(linkedList1?.head, node1!);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node3!);

      expect(linkedList1?.head?.next, node2);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next, node3);
      expect(linkedList1?.node(1)?.previous, linkedList1?.head);
      expect(linkedList1?.node(2)?.next, null);
      expect(linkedList1?.node(2)?.previous, node2);
    });
    test('append value', () {
      linkedList1?.appendValue(1);
      linkedList1?.appendValue(2);
      linkedList1?.appendValue(3);

      expect(linkedList1?.lenght, 3);
      expect(linkedList1?.head?.value, 1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 3);

      expect(linkedList1?.head?.next?.value, 2);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next?.value, 3);
      expect(linkedList1?.node(1)?.previous?.value, 1);
      expect(linkedList1?.node(2)?.next, null);
      expect(linkedList1?.node(2)?.previous?.value, 2);
    });
    test('append list', () {
      linkedList1?.appendValue(1);
      linkedList1?.appendValue(2);
      linkedList1?.appendValue(3);

      linkedList2?.appendValue(4);
      linkedList2?.appendValue(5);
      linkedList2?.appendValue(6);

      linkedList1?.appendList(linkedList2!);

      expect(linkedList1?.lenght, 6);
      expect(linkedList1?.head?.value, 1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 6);

      expect(linkedList1?.node(2)?.next?.value, 4);
      expect(linkedList1?.node(2)?.previous?.value, 2);
      expect(linkedList1?.node(3)?.next?.value, 5);
      expect(linkedList1?.node(3)?.previous?.value, 3);
    });
    test('insert node', () {
      linkedList1?.insertNode(node1!, 0);
      linkedList1?.insertNode(node2!, 0);
      linkedList1?.insertNode(node3!, 0);

      expect(linkedList1?.lenght, 3);
      expect(linkedList1?.head, node3!);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node1!);

      expect(linkedList1?.head?.next, node2);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next, node1);
      expect(linkedList1?.node(1)?.previous, linkedList1?.head);
      expect(linkedList1?.node(2)?.next, null);
      expect(linkedList1?.node(2)?.previous, node2);
    });
    test('insert value', () {
      linkedList1?.insertValue(1, 0);
      linkedList1?.insertValue(2, 0);
      linkedList1?.insertValue(3, 0);

      expect(linkedList1?.lenght, 3);
      expect(linkedList1?.head?.value, 3);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 1);

      expect(linkedList1?.head?.next?.value, 2);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next?.value, 1);
      expect(linkedList1?.node(1)?.previous?.value, linkedList1?.head?.value);
      expect(linkedList1?.node(2)?.next, null);
      expect(linkedList1?.node(2)?.previous?.value, 2);
    });
    test('insert list', () {
      linkedList1?.insertValue(1, 0);
      linkedList1?.insertValue(2, 0);
      linkedList1?.insertValue(3, 0);

      linkedList2?.insertValue(4, 0);
      linkedList2?.insertValue(5, 0);
      linkedList2?.insertValue(6, 0);

      linkedList1?.insertList(linkedList2!, 1);

      expect(linkedList1?.lenght, 6);
      expect(linkedList1?.head?.value, 3);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 1);

      expect(linkedList1?.head?.next?.value, 6);
      expect(linkedList1?.node(3)?.next?.value, 2);
      expect(linkedList1?.node(1)?.previous?.value, 3);
    });
    test('insert out of range', () {
      linkedList1?.insertValue(1, 0);
      linkedList1?.insertValue(2, 5);

      expect(linkedList1?.lenght, 2);
      expect(linkedList1?.head?.value, 1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 2);

      expect(linkedList1?.head?.next?.value, 2);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next, null);
      expect(linkedList1?.node(1)?.previous?.value, 1);
    });
    test('insert negative', () {
      linkedList1?.insertValue(1, 0);
      linkedList1?.insertValue(2, -6);

      expect(linkedList1?.lenght, 2);
      expect(linkedList1?.head?.value, 2);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last?.value, 1);

      expect(linkedList1?.head?.next?.value, 1);
      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.node(1)?.next, null);
      expect(linkedList1?.node(1)?.previous?.value, 2);
    });
    test('removeAll', () {
      linkedList1?.appendValue(1);
      linkedList1?.appendValue(2);
      linkedList1?.appendValue(3);
      linkedList1?.removeAll();

      expect(linkedList1?.lenght, 0);
      expect(linkedList1?.head, null);
      expect(linkedList1?.isEmpty, true);
      expect(linkedList1?.last, null);
    });
    test('removeLast', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.appendNode(node2!);
      linkedList1?.removeLast();

      expect(linkedList1?.lenght, 1);
      expect(linkedList1?.head, node1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node1);

      expect(linkedList1?.head?.next, null);
      expect(linkedList1?.head?.previous, null);
    });
    test('removeLast more times', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.removeLast();
      linkedList1?.removeLast();

      expect(linkedList1?.lenght, 0);
      expect(linkedList1?.head, null);
      expect(linkedList1?.isEmpty, true);
      expect(linkedList1?.last, null);
    });
    test('removeAt', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.appendNode(node2!);
      linkedList1?.removeAt(0);

      expect(linkedList1?.lenght, 1);
      expect(linkedList1?.head, node2);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node2);

      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.head?.next, null);
    });
    test('removeAt more times', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.removeAt(0);
      linkedList1?.removeAt(0);

      expect(linkedList1?.lenght, 0);
      expect(linkedList1?.head, null);
      expect(linkedList1?.isEmpty, true);
      expect(linkedList1?.last, null);
    });
    test('removeAt not in range', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.appendNode(node2!);
      linkedList1?.removeAt(5);

      expect(linkedList1?.lenght, 2);
      expect(linkedList1?.head, node1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node2);

      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.head?.next, node2);
    });
    test('removeAt negative', () {
      linkedList1?.appendNode(node1!);
      linkedList1?.appendNode(node2!);
      linkedList1?.removeAt(-5);

      expect(linkedList1?.lenght, 2);
      expect(linkedList1?.head, node1);
      expect(linkedList1?.isEmpty, false);
      expect(linkedList1?.last, node2);

      expect(linkedList1?.head?.previous, null);
      expect(linkedList1?.head?.next, node2);
    });
  });
}
