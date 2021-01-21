import 'binary_node.dart';
// Binary search tree
// Left child is always smaller than parent, right child is always bigger than parent

// Extension for T that is number
extension BinarySearchTree<T extends num> on BinaryNode {
  // MARK: - Methods
  void insert(T value) {
    if (value < this.value) {
      if (left != null) { left?.insert(value); } else { left = BinaryNode(value); }
    } else { 
      if (right != null) { right?.insert(value); } else { right = BinaryNode(value); }
    }
  }
}

// TODO: - Dart doesn't show error before you run that code.

// ```
// BinaryNode<String> nodeString = BinaryNode("1");
// BinaryNode<int> nodeInt = BinaryNode(1);
//
// nodeInt.insert(5);
// nodeString.insert(5);
//
// nodeString();
// nodeInt();
// ```