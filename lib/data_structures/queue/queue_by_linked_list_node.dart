import 'queue.dart';
import 'package:flutter_cs/data_structures/linked_list/linked_list_node.dart';

class QueueByLinkedListNode<T> extends IQueue<T> {
  // MARK: - Properties
  Node? _head;

  bool get isEmpty => _head == null;
  T? get peek => _head?.value;
  int get length {
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
  void enqueue(T element) => !isEmpty ? _head?.setNext(Node(element, previous: _head)) : _head = Node(element);
  T? dequeue() {
    T? value = _head?.value;
    _head = _head?.next;
    _head?.setPrevious(null);
    return value;
  }
}
