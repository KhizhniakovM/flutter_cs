abstract class IStack<T> {
  bool get isEmpty;
  int get lenght;
  T? get peek;

  void push(T element);
  T? pop();
}