// NOTE: - for this example all keys are unique
class BST_Node<Key extends int, Value> {
  // MARK: - Properties
  final Key key;
  final Value value;

  BST_Node<Key, Value>? leftNode;
  BST_Node<Key, Value>? rightNode;

  // MARK: - Initializers
  BST_Node(
      {required this.key, required this.value, this.leftNode, this.rightNode});
}
