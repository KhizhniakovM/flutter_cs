import 'package:flutter_cs/data_structures/binary_tree/bst_node.dart';

class BST_Tree<Key extends int, Value> {
  // MARK: - Properties
  BST_Node<Key, Value>? root;

  // MARK: - Initializers
  BST_Tree({this.root});

  BST_Node<Key, Value>? search(Key key) => _search(key, root);
  void insert({required BST_Node<Key, Value> node}) => root = _insert(node, root);
  void delete({required Key key}) => root = _delete(key, root);

  BST_Node<Key, Value>? _search(Key key, BST_Node<Key, Value>? newRoot) {
    if (newRoot == null) { return null; }
    if (newRoot.key == key) { return root; }
    if (newRoot.key > key) { return _search(key, newRoot.leftNode); }
    if (newRoot.key < key) { return _search(key, newRoot.rightNode); }
  }
  BST_Node<Key, Value>? _insert(BST_Node<Key, Value> node, BST_Node<Key, Value>? newRoot) {
    if (newRoot == null) { return node; }
    if (newRoot.key > node.key) { newRoot.leftNode = _insert(node, newRoot.leftNode); }
    else if (newRoot.key < node.key) { newRoot.rightNode = _insert(node, newRoot.rightNode); }
    return newRoot;
  }
  BST_Node<Key, Value>? _delete(Key key, BST_Node<Key, Value>? newRoot) {
    if (newRoot == null) { return null; }
    if (newRoot.key > key) { newRoot.leftNode = _delete(key, newRoot.leftNode); }
    else if (newRoot.key < key) { newRoot.rightNode = _delete(key, newRoot.rightNode); }
    else if (newRoot.key == key) {
      if (newRoot.leftNode == null) { return newRoot.rightNode; }
      else if (newRoot.rightNode == null) { return newRoot.leftNode; }

      var tmp = _min(newRoot);
      delete(key: tmp.key);
      return tmp;
    }
    return newRoot;
}
  BST_Node<Key, Value> _min(BST_Node<Key, Value> newRoot) {
    while (newRoot.leftNode != null) {
      newRoot = newRoot.leftNode!;
    }
  return newRoot;
}
}
void main() {
  var node1 = BST_Node(key: 1, value: "1");
  var node2 = BST_Node(key: 2, value: "2");
  var node3 = BST_Node(key: 3, value: "3");
  var node4 = BST_Node(key: 25, value: "25");
  var node5 = BST_Node(key: 65, value: "65");
  var node6 = BST_Node(key: 11, value: "11");

  var tree = BST_Tree();
  tree.insert(node: node4);
  tree.insert(node: node1);
  tree.insert(node: node2);
  tree.insert(node: node5);
  tree.insert(node: node3);
  tree.insert(node: node6);

  tree.delete(key: 25);

  print(tree.root!.value);
  print(tree.root!.leftNode?.value);
  print(tree.root!.rightNode?.value);
  // TODO: - Need to test
}
