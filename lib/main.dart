import 'package:flutter_cs/data_structures/binary_tree.dart';

void main() {
  BinaryNode<int> node = BinaryNode(25);

  BinaryNode<int> node1 = BinaryNode(1);
  BinaryNode<int> node2 = BinaryNode(2);
  BinaryNode<int> node3 = BinaryNode(3);
  BinaryNode<int> node4 = BinaryNode(4);
  BinaryNode<int> node5 = BinaryNode(5);

  node.left = node1;
  node.right = node2;

  node1.left = node3;
  node2.right = node4;
  node4.left = node5;

  print(node());
}