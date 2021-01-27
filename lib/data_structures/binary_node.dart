// Binary tree is a tree that nodes have only 0, 1 or 2 children

class BinaryNode<T> {
  // MARK: - Properties
  final T value;
  BinaryNode<T>? left, right;

  // MARK: - Initializers
  BinaryNode(this.value, {this.left, this.right});

  // MARK: - Call
  String call() => '$value { ${left?.call()}; ${right?.call()} }';
}
