// ==================================================
// Kinds of lists:

// Static list
// Vector list - increment size by vector
// Factor list - increment size of two times
// Matrix list
// Dynamic list
// Sparse list - with many empty fields
// Associative list - list of keys
// Parallel list - anti pattern

abstract class IList<T> {
  // MARK: - Methods
  int size();
  int trueSize();
  void add(T element);
  T? get(int index);

  // void addAt(T element, int index);
  T? removeAt(int index);

  List<T?> resize(List<T?> list, int delta) {
    if ((this.size() + delta) <= 0) {
      return List<T?>.empty();
    }
    List<T?> newArray = List<T?>.filled(this.trueSize() + delta, null);
    delta > 0
        ? List.copyRange(newArray, 0, list)
        : List.copyRange(newArray, 0, list, 0, list.length + delta);
    return newArray;
  }
}