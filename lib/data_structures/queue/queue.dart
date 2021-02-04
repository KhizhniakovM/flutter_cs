abstract class IQueue<T> {
  T? get peek;
  int get length;
  bool get isEmpty;

  void enqueue(T element);
  T? dequeue();
}

