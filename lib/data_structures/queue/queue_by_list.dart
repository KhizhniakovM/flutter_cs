import 'package:flutter_cs/data_structures/queue/queue.dart';

class QueueByList<T> extends IQueue<T> {
  // MARK: - Properties
  final List<T> _list = [];

  T? get peek => _list.isEmpty ? null : _list.first;
  int get length => _list.length;
  bool get isEmpty => _list.isEmpty;

  // MARK: - Methods
  void enqueue(T element) => _list.add(element);
  T? dequeue() => _list.isEmpty ? null : _list.removeAt(0);

  // MARK: - Call
  void call() => print('$_list');
}