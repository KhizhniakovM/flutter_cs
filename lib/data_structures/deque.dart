import 'dart:math';
// Double ended queue. You can add and remove elements from both sides
// NOTE: - Simple but not very efficient

class Deque<T> {
// MARK: - Properties
  final List<T?> _list = [];

  bool get isEmpty => _list.isEmpty;
  int get length => _list.length;
  T? get peekFront => isEmpty ? null : _list.first;
  T? get peekBack => isEmpty ? null : _list.last;

// MARK: - Methods
  void enqueue(T element) => _list.add(element);
  void enqueueFront(T element) => _list.insert(0, element);

  T? dequeue() => isEmpty ? null : _list.removeAt(0);
  T? dequeueBack() => isEmpty ? null : _list.removeLast();
}

// NOTE: - More efficient realisation
class BetterDeque<T> extends Deque<T> {
  // MARK: - Properties
  @override 
  late List<T?> _list;
  late int _head;
  late int _capacity;
  late int _originalCapacity;

  @override
  int get length => _list.length - _head; 
  @override
  bool get isEmpty => length == 0;
  @override
  T? get peekFront => isEmpty ? null : _list[_head];

  // MARK: - Initializers
  BetterDeque({int capacity = 10}) {
    _list = List<T?>.filled(capacity, null, growable: true);
    _capacity = max(capacity, 1);
    _originalCapacity = _capacity;
    _head = _capacity;
  }

  // MARK: - Methods
  // TODO: - Change method in swift algorithm club
  @override
  void enqueueFront(T element) {
    if (_head == 0) {
      List<T?> emptyList = List<T?>.filled(_capacity, null);
      _list.insertAll(0, emptyList);
      _head = _capacity;
      _capacity *= 2;
    }
    _head--;
    _list[_head] = element;
  }
  @override 
  T? dequeue() {
    if (_head > _list.length) { return null; }
    T? result = _list[_head];
    _list[_head] = null;
    _head++;
    // TODO: - Check this method 
    if (_capacity >= _originalCapacity && _head >= _capacity * 2) {
      int amountToRemove = _capacity + _capacity * 2;
      _list.removeRange(0, amountToRemove - 1);
      _head -= amountToRemove;
      _capacity ~/= 2;
    }
    return result;
  }
}
