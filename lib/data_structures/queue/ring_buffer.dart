// NOTE: - Better than base queue by list, because dequeue = O(1).
// NOTE: - But there is a huge disadvantage - you can't resize your queue,
// if you add more elements that you have in your buffer size
// next elements will be removed

class RingBuffer<T> {
  // MARK: - Properties
  late List<T?> _list;
  int _readIndex = 0;
  int _writeIndex = 0;

  // MARK: - Specific methods
  int get availableSpaceForReading => _writeIndex - _readIndex;
  int get availableSpaceForWriting => _list.length - availableSpaceForReading;
  bool get isFull => availableSpaceForWriting == 0;
  bool get isEmpty => availableSpaceForReading == 0;

  // MARK: - Initializers
  RingBuffer(int bufferSize) {
    _list = List<T?>.filled(bufferSize, null);
  }

  // MARK: - Methods
  bool write(T element) {
    if (isFull) { return false; }
    _list[_writeIndex % _list.length] = element;
    _writeIndex++;
    return true;
  }
  T? read() {
    if (isEmpty) { return null; }
    T? result = _list[_readIndex % _list.length];
    _readIndex++;
    return result;
  }
}
