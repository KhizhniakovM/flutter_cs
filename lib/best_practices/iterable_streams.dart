void main() {
  Stream<int>.periodic(Duration(seconds: 1), (number) {
    return number;
  }).listen(print);
}

// Iterable
void iterableTest() {
  final list = <int>[1, 2, 3, 4, 5];
  // Will not work
  // Because map return lazy iterable
  // NOTE: - Interesting
  list.map((e) => print('map ' + '$e'));
  // Will work
  list.map((e) => print('map to list' + '$e')).toList();
  // Will work
  list.forEach((element) {
    print('forEach' + '$element');
  });
}

// It is more efficient than next example
// Because it will use only numbers, thats I really need
//
// In short, we can limit number of sync values if we need
Iterable<int> syncGen() sync* {
  for (int i = 1; i <= 5; i++) {
    print('* $i');
    yield i;
  }
}

// This method at first make all list, and than pass it to forward
List<int> makeList() {
  List<int> list = [];
  for (int i = 1; i <= 5; i++) {
    print('list $i');
    list.add(i);
  }
  return list;
}

// MARK: - My own iterable
// It is immutable, we only can read it
//
class Puppets extends Iterable<Puppet> {
  final List<Puppet> _list = [];

  @override
  Iterator<Puppet> get iterator => _list.iterator;
}

class Puppet {}

// Streams
// It is an iterable that is stratching in the time
void makeStream() {
  // Stream.fromFuture(future)
  // Stream.fromIterable([1,2,3]);
  // Stream.fromFutures(futures);
}
// sync* ans async* generators
