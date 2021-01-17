class Stack<T> {
  // MARK: - Properties
  final List<T> _list = [];

  bool get isEmpty => _list.isEmpty;
  int get lenght => _list.length;
  T? get peek => _list.isEmpty ? null : _list.last;

  // MARK: - Methods
  void push(T element) => _list.add(element);
  T? pop() => _list.isEmpty ? null : _list.removeLast();

  // MARK: - Call
  void call() => print('$_list');
}
