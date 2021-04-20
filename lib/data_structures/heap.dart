class BinaryHeap<Key extends int, Value> {
  List<HeapElement<Key, Value>> _list = [];
  List<HeapElement<Key, Value>> get list => _list;

  BinaryHeap();
  BinaryHeap.from(List<HeapElement<Key, Value>> list) {
    _list = list;
    for (int i = size ~/ 2; i >= 0; i--) {
      heapify(i);
    }
  }

  int get size => _list.length;

  // MARK: - Add
  void add(HeapElement<Key, Value> element) {
    _list.add(element);

    int i = size - 1;
    int parent = (i - 1) ~/ 2;

    while (i > 0 && _list[parent].key < _list[i].key) {
      var tmp = _list[i];
      _list[i] = _list[parent];
      _list[parent] = tmp;

      i = parent;
      parent = (i - 1) ~/ 2;
    }
  }

  // MARK: - Heapify
  void heapify(int i) {
    int leftChild;
    int rightChild;
    int largestChild;

    for (;;) {
      leftChild = 2 * i + 1;
      rightChild = 2 * i + 2;
      largestChild = i;

      if (leftChild < size && _list[leftChild].key > _list[largestChild].key) {
        largestChild = leftChild;
      }
      if (rightChild < size &&
          _list[rightChild].key > _list[largestChild].key) {
        largestChild = rightChild;
      }
      if (largestChild == i) {
        break;
      }
      var tmp = _list[i];
      list[i] = list[largestChild];
      list[largestChild] = tmp;
      i = largestChild;
    }
  }

  // MARK: - GetMax
  HeapElement<Key, Value> getMax() {
    HeapElement<Key, Value> result = _list[0];
    _list[0] = _list[size - 1];
    _list.removeAt(size - 1);
    heapify(0);
    return result;
  }
}

class HeapElement<Key extends int, Value> {
  final Key key;
  final Value value;

  HeapElement({required this.key, required this.value});
}

void main() {
  HeapElement el1 = HeapElement(key: 1, value: '1');
  HeapElement el2 = HeapElement(key: 2, value: '2');
  HeapElement el3 = HeapElement(key: 3, value: '3');
  HeapElement el4 = HeapElement(key: 4, value: '4');
  HeapElement el5 = HeapElement(key: 5, value: '5');
  HeapElement el6 = HeapElement(key: 6, value: '6');
  HeapElement el7 = HeapElement(key: 7, value: '7');
  HeapElement el8 = HeapElement(key: 8, value: '8');
  HeapElement el9 = HeapElement(key: 9, value: '9');
  HeapElement el0 = HeapElement(key: 0, value: '0');

  List<HeapElement> list = [el2, el4, el7, el1, el9, el0, el8, el6, el3, el5];

  BinaryHeap heap = BinaryHeap.from(list);

  for (var i in heap.list) {
    print(i.value);
  }
}
