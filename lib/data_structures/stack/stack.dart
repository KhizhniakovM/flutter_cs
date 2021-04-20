abstract class IStack<T> {
  bool get isEmpty;
  int get length;
  T? get peek;

  void push(T element);
  T? pop();
}
