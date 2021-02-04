import 'package:flutter_cs/data_structures/list/list.dart';

class FactorList<T> extends IList<T> {
  // MARK: - Properties
  List<T?> _list = List<T?>.empty();
  int _size = 0;

  int size() => _size;
  int trueSize() => _list.length;
  T? get(int index) => _list[index];

  // MARK: - Methods
  void add(T element) {
    if (size() == _list.length && size() == 0) {
      _list = this.resize(_list, 1);
    } else if (size() == _list.length) {
      _list = this.resize(_list, _size * 2);
    }
    _list[_size] = element;
    _size++;
  }

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
      _list[i + 1] = null;
    }
    _size--;
    if (_list.length - size() == _list.length ~/ 2) {
      _list = this.resize(_list, -((size() + 1) ~/ 2));
    }
    return result;
  }
}