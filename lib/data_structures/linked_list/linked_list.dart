import 'package:flutter_cs/data_structures/linked_list/linked_list_node.dart';

class LinkedList<T> {
  // MARK: - Properties
  Node? _head;
  Node? get head => _head;

  bool get isEmpty => _head == null ? true : false;
  Node? get last {
    if (_head == null) return null;
    Node node = _head!;
    while (node.next != null) {
      node = node.next!;
    }
    return node;
  }

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

  // MARK: - Initializer
  LinkedList([this._head]);

  // MARK: - Methods
  Node? node(int index) {
    if (index < 0) return null;
    if (this.isEmpty) return null;

    if (index == 0) return _head;
    Node? node = _head;
    for (int i = 0; i < index; i++) {
      node = node?.next;
      if (node == null) break;
    }
    return node;
  }

  // MARK: - Append
  void appendValue(T value) {
    Node newNode = Node(value);
    this.appendNode(newNode);
  }

  void appendNode(Node node) {
    if (last == null) {
      _head = node;
      return;
    }
    Node? lastNode = last;

    node.setPrevious(lastNode);
    lastNode?.setNext(node);
  }

  void appendList(LinkedList list) {
    if (list.isEmpty) return;
    Node newNode = list.head!;
    this.appendNode(newNode);
  }

  // MARK: - Insert
  // NOTE: - Warning!
  // I made it with non-typical behaviour, for fun.
  // If you insert new node out of range, it will append in the end of list
  // If you insert new node in negative index it will insert it in the index 0
  void insertValue(T value, int index) {
    Node newNode = Node(value);
    insertNode(newNode, index);
  }

  void insertNode(Node node, int index) {
    if (index <= 0) {
      node.setNext(_head);
      _head?.setPrevious(node);
      _head = node;
    } else {
      if (index > this.lenght) {
        index = this.lenght;
      }
      Node? previous = this.node(index - 1);
      Node? next = previous?.next;

      node.setPrevious(previous);
      node.setNext(next);
      next?.setPrevious(node);
      previous?.setNext(node);
    }
  }

  void insertList(LinkedList list, int index) {
    if (list.isEmpty) return;
    if (index <= 0) {
      list.last?.setNext(_head);
      _head?.setPrevious(list.last);
      _head = list.head;
    } else {
      if (index > this.lenght) {
        index = this.lenght;
      }
      Node? previous = this.node(index - 1);
      Node? next = previous?.next;

      list.head?.setPrevious(previous);
      list.last?.setNext(next);
      next?.setPrevious(list.last);
      previous?.setNext(list.head);
    }
  }

  // MARK: - Remove
  // NOTE: - Warning!
  // I made it with non-typical behaviour, for fun.
  // If you remove node that out of range or in negative index or from empty list
  // you will return null without any warnings
  void removeAll() {
    _head = null;
  }

  T? remove(Node? node) {
    if (node == null) return null;
    Node? previous = node.previous;
    Node? next = node.next;

    if (previous != null) {
      previous.setNext(next);
    } else {
      _head = next;
    }
    if (next != null) {
      next.setPrevious(previous);
    }

    node.setNext(null);
    node.setPrevious(null);
    return node.value;
  }

  T? removeLast() => this.isEmpty ? null : remove(last);
  T? removeAt(int index) {
    if (this.isEmpty) return null;
    Node? node = this.node(index);
    return remove(node);
  }

  // MARK: - Call
  void call() {
    String result = '[';
    Node? node = _head;

    while (node != null) {
      result += '$node';
      node = node.next;
      if (node != null) {
        result += ', ';
      }
    }
    print('$result' ']');
  }
}
