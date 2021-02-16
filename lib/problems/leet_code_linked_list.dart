import 'package:flutter_cs/data_structures/linked_list/singly_linked_list_node.dart' as SLL; // SinglyLinkedList

// MARK: - Reverse Linked List 
SLL.Node<int> reverseLinkedList(SLL.Node<int> head) {
  // We need three temp variables to go throw list
  // Previous, current, and next(inside the loop)
  SLL.Node<int>? previousNode;
  SLL.Node<int>? currentNode = head;

  while (currentNode != null) {
    SLL.Node<int>? nextNode = currentNode.next;

    // At first we set another next for current node, to reverse it
    currentNode.setNext(previousNode);
    // Than we move nodes to right
    previousNode = currentNode;
    currentNode = nextNode;
  }
  return previousNode!;
}

