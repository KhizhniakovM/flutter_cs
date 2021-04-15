import 'package:flutter_cs/data_structures/binary_tree/avl_node.dart';

class AVL_Tree<Key extends int, Value> {
  // MARK: - Properties
  AVL_Node<Key, Value>? root;

  // MARK: - Initializers
  AVL_Tree({this.root});

  void insert(AVL_Node<Key, Value> node) {
    if (root == null) {
      root = node;
      return;
    }
    root?.insert(node);
  }
  // MARK: - Search 
  AVL_Node<Key, Value>? search(Key key) => root?.search(key);
  // MARK: - Delete
  void delete(Key key) {
    if (root?.key == key) {
      var tmp = root?.rightNode;
      root = root?.leftNode;
      if (tmp != null) root?.insert(tmp);
    } else {
      root?.delete(key);
    }
  }

  // MARK: - Traverse
  void traverseInOrder(Function(Value value) process) =>
      root?.traverseInOrder(process);
  void traversePreOrder(Function(Value value) process) =>
      root?.traversePreOrder(process);
  void traversePostOrder(Function(Value value) process) =>
      root?.traversePostOrder(process);
}