class Queue<T> {
  // MARK: - Properties
  List<T> _list = [];
  
  T? get peek => _list.first;
  int get count => _list.length;
  bool get isEmpty => _list.isEmpty;
  
  // MARK: - Methods
  void enqueue(T element) => _list.add(element);

  T? dequeue() {
    if (_list.isEmpty) return null; 
    return _list.removeAt(0);
  }
}