class Node<T> {
  // MARK: - Properties
  final T _value;
  T get value => _value;

  Node? _next;
  Node? get next => _next;
  Node? _previous;
  Node? get previous => _previous;

  // MARK: - Initializer
  Node(this._value, {Node? next, Node? previous}) {
    this._next = next;
    this._previous = previous;
  }

  // MARK: - Methods
  void setNext(Node? node) => this._next = node;
  void setPrevious(Node? node) => this._previous = node;
  String toString() => '$_value';
}