import 'package:flutter_cs/data_structures/linked_list/linked_list_node.dart';
import 'stack.dart';
// NOTE: - It is will be good to use linked list only with reference on next node 
class StackByLinkedListNode<T> extends IStack<T> {
  // MARK: - Properties
  Node? _head;

  bool get isEmpty => _head == null;
  T? get peek => _head?.value;
  int get lenght {
    if (_head == null) return 0;
    int result = 1;
    Node? node = _head;
    while (node?.next != null) {
      node = node?.next;
      result++;
    }
    return result;
  }

  // MARK: - Methods
  void push(T value) => _head = Node(value, next: _head);
  T? pop() {
    if (isEmpty) {
      return null;
    }
    T value = _head?.value;
    _head = _head?.next;
    return value;
  }
}
