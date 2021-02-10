import '../binary_tree/binary_node.dart';

class BinaryTree<T extends num> {
  // MARK: - Properties
  BinaryNode<T>? _root;
  BinaryNode<T>? get root => _root;

  // MARK: - Initializers
  BinaryTree([this._root]);
  BinaryTree.from(List<T> list) : _root = BinaryNode(list.first) {
    for (var i = 1; i < list.length; i++) {
      this.insertValue(list[i]);
    }
  }

  // MARK: - Insertion
  void insertValue(T value) {
    BinaryNode<T> node = BinaryNode<T>(value);
    if (root == null) { _root = node; } 
    else { this._insertNode(_root!, node); }
  }
  void _insertNode(BinaryNode<T> root, BinaryNode<T> node) {
    if (root.value > node.value) {
      root.left != null ? this._insertNode(root.left!, node) : root.left = node;
    } else {
      root.right != null ? this._insertNode(root.right!, node) : root.right = node;
    }
  }

  // MARK: - Traverse
  // Preorder
  
}
