import 'package:flutter_cs/data_structures/list/list.dart';

class SingleList<T> extends IList<T> {
  // MARK: - Properties
  List<T?> _list = List<T?>.empty();

  int trueSize() => _list.length;
  int size() => _list.length;
  T? get(int index) => _list[index];

  // MARK: - Methods
  void add(T element) {
    _list = this.resize(_list, 1);
    _list[this.size() - 1] = element;
  }

  // @override
  // void addAt(T element, int index) {}

  // NOTE: - Nothing to do, when index is incorrect.
  T? removeAt(int index) {
    if (index < 0 || index >= _list.length) {
      return null;
    }
    T? result = this.get(index);

    for (int i = index; i < _list.length; i++) {
      if (i == _list.length - 1) {
        break;
      }
      _list[i] = _list[i + 1];
    }
    _list = this.resize(_list, -1);
    return result;
  }
}