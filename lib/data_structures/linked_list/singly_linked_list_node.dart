class Node<T> {
  // MARK: - Properties
  final T _value;
  T get value => _value;

  Node<T>? _next;
  Node<T>? get next => _next;

  // MARK: - Initializer
  Node(this._value, {Node<T>? next}) {
    this._next = next;
  }

  // MARK: - Methods
  void setNext(Node<T>? node) => this._next = node;

  String toString() {
    List<T> result = [];
    Node? currentNode = this;

    while (currentNode != null) {
      result.add(currentNode.value);
      currentNode = currentNode.next;
    }
    return result.join(', ');
  }
}
