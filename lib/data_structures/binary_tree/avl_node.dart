// Сбалансированное двоичное дерево поиска
// Адельсон-Вельский, Ландис => АВЛ-деревья
// TODO: - Need to make
import 'dart:math';

class AVL_Node<Key extends int, Value> {
  final Key key;
  final Value value;

  AVL_Node<Key, Value>? leftNode;
  AVL_Node<Key, Value>? rightNode;
  AVL_Node<Key, Value>? parentNode;

  int _height = 0;
  int height(AVL_Node<Key, Value>? node) => node?._height ?? 0;

  int get balance => (leftNode?._height ?? 0) - (rightNode?._height ?? 0);
  void recalculateHeight() =>
      _height = max(height(leftNode), height(rightNode)) + 1;

  AVL_Node(
      {required this.key,
      required this.value,
      this.leftNode,
      this.rightNode,
      this.parentNode});

  // MARK: - Balance
  
  void makeBalanced() {
    if (balance >= 2) {

    }
  }
  AVL_Node<Key, Value>? smallRightRotation() {
    if (height(leftNode) - height(rightNode) == 2 &&
        height(leftNode?.rightNode) <= height(leftNode?.leftNode)) {
      var tmp = leftNode;

      this.leftNode = tmp?.rightNode;
      tmp?.rightNode = this;

      tmp?.parentNode = this.parentNode;
      parentNode = tmp;
      this.leftNode?.parentNode = this;

      return tmp;
    }
  }

  AVL_Node<Key, Value>? smallLeftRotation() {
    if (height(rightNode) - height(leftNode) == 2 &&
        height(rightNode?.leftNode) <= height(rightNode?.rightNode)) {
      var tmp = rightNode;

      this.rightNode = tmp?.leftNode;
      tmp?.leftNode = this;

      tmp?.parentNode = this.parentNode;
      parentNode = tmp;
      this.rightNode?.parentNode = this;

      return tmp;
    }
  }

  void bigRightRotation() {
    if (height(leftNode) - height(rightNode) == 2 &&
        height(leftNode?.rightNode) > height(leftNode?.leftNode)) {
          leftNode = leftNode?.smallLeftRotation();
          smallRightRotation();
        }
  }

  void bigLeftRotation() {
    if (height(rightNode) - height(leftNode) == 2 &&
        height(rightNode?.leftNode) > height(rightNode?.rightNode)) {
          rightNode = rightNode?.smallRightRotation();
          smallLeftRotation();
        }
  }

  // MARK: - Search
  AVL_Node<Key, Value>? search(Key key) {
    if (this.key == key) {
      return this;
    } else if (this.key < key) {
      return rightNode?.search(key);
    } else if (this.key > key) {
      return leftNode?.search(key);
    }
  }

  // MARK: - Insert
  void insert(AVL_Node<Key, Value> node) {
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
    recalculateHeight();
    makeBalanced();
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
