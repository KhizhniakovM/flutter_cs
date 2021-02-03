// ==================================================
// Kinds of lists:

// Static list
// Vector list - increment size by vector
// Factor list - increment size of two times
// Dynamic list
// Sparse list - with many empty fields
// Associative list - list of keys
// Parallel list - anti pattern

abstract class IList<T> {
  // MARK: - Methods
  int size();
  void add(T element);
  T? get(int index);

  // void addAt(T element, int index);
  T? removeAt(int index);

  List<T?> resize(List<T?> list, int delta) {
    if ((this.size() + delta) <= 0) {
      return List<T?>.empty();
    }
    List<T?> newArray = List<T?>.filled(this.size() + delta, null);
    delta > 0
        ? List.copyRange(newArray, 0, list)
        : List.copyRange(newArray, 0, list, 0, list.length + delta);
    return newArray;
  }
}

// ==================================================
class SingleList<T> extends IList<T> {
  // MARK: - Properties
  List<T?> _list = List<T?>.empty();

  @override
  int size() => _list.length;
  @override
  T? get(int index) => _list[index];

  // MARK: - Methods
  @override
  void add(T element) {
    _list = this.resize(_list, 1);
    _list[this.size() - 1] = element;
  }

  // @override
  // void addAt(T element, int index) {}

  // NOTE: - Nothing to do, when index is incorrect.
  @override
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

// ==================================================
class VectorList<T> extends IList<T> {
  // MARK: - Properties
  List<T?> _list = List<T?>.empty();
  int _vector;
  int _size = 0;

  // MARK: - Initializers
  VectorList(this._vector);

  @override
  int size() => _size;
  int trueSize() => _list.length;
  @override
  T? get(int index) => _list[index];

  // MARK: - Methods
  @override
  void add(T element) {
    if (size() == _list.length) {
      _list = this.resize(_list, _vector);
    }
    _list[_size] = element;
    _size++;
  }

  @override
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
    if (_list.length - size() == 10) {
      _list = this.resize(_list, -_vector);
    }
    return result;
  }
}

// ==================================================
class FactorList<T> extends IList<T> {
  // MARK: - Properties
  List<T?> _list = List<T?>.empty();
  int _size = 0;

  @override
  int size() => _size;
  @override
  T? get(int index) => _list[index];

  // MARK: - Methods
  @override
  void add(T element) {
    if (size() == _list.length && size() == 0) {
      _list = this.resize(_list, 1);
    } else if (size() == _list.length) {
      _list = this.resize(_list, _size * 2);
    }
    _list[_size] = element;
    _size++;
  }

  @override
  T? removeAt(int index) {
    
  }
}
