class BinaryHeap<Key extends int, Value> {
  List<HeapElement> _list = [];
  List<HeapElement> get list => _list;

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

  BinaryHeap heap = BinaryHeap();
  heap.add(el2);
  heap.add(el4);
  heap.add(el7);
  heap.add(el1);
  heap.add(el9);
  heap.add(el0);
  heap.add(el8);
  heap.add(el6);
  heap.add(el3);
  heap.add(el5);

  for (var i in heap.list) {
    print(i.value);
  }
}