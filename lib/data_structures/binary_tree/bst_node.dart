class BST_Node<Key extends int, Value> {
  // MARK: - Properties
  final Key key;
  final Value value;

  BST_Node<Key, Value>? leftNode;
  BST_Node<Key, Value>? rightNode;
  BST_Node<Key, Value>? parentNode;

  // MARK: - Initializers
  BST_Node(
      {required this.key,
      required this.value,
      this.leftNode,
      this.rightNode,
      this.parentNode});

  // MARK: - Search
  BST_Node<Key, Value>? search(Key key) {
    if (this.key == key) {
      return this;
    } else if (this.key < key) {
      return rightNode?.search(key);
    } else if (this.key > key) {
      return leftNode?.search(key);
    }
  }

  // MARK: - Insert
  void insert(BST_Node<Key, Value> node) {
    if (this.key == node.key) {
      // NOTE: - We can realise list with values with similar keys
      return;
    } else if (this.key < node.key) {
      if (this.rightNode == null) {
        this.rightNode = node;
        node.parentNode = this;
      } else {
        this.rightNode?.insert(node);
      }
    } else if (this.key > node.key) {
      if (this.leftNode == null) {
        this.leftNode = node;
        node.parentNode = this;
      } else {
        this.leftNode?.insert(node);
      }
    }
  }

  // MARK: - Delete
  void delete(Key key) {
    if (this.key == key) {
      parentNode!.key < key
          ? parentNode?.rightNode = null
          : parentNode?.leftNode = null;
      if (leftNode != null) {
        parentNode?.insert(leftNode!);
      }
      if (rightNode != null) {
        parentNode?.insert(rightNode!);
      }
    } else if (this.key < key) {
      this.rightNode?.delete(key);
    } else if (this.key > key) {
      this.leftNode?.delete(key);
    }
  }

  // MARK: - Traverses
  // Центрированный обход дерева
  void traverseInOrder(Function(Value value) process) {
    leftNode?.traverseInOrder(process);
    process(this.value);
    rightNode?.traverseInOrder(process);
  }

  // Прямой обход дерева
  void traversePreOrder(Function(Value value) process) {
    process(this.value);
    leftNode?.traversePreOrder(process);
    rightNode?.traversePreOrder(process);
  }

  // Обратный обход дерева
  void traversePostOrder(Function(Value value) process) {
    leftNode?.traversePostOrder(process);
    rightNode?.traversePostOrder(process);
    process(this.value);
  }
}
