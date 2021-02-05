import 'package:flutter_cs/data_structures/queue/ring_buffer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // MARK: - Properties
  RingBuffer<int>? ringBuffer;

  setUp(() {
    ringBuffer = RingBuffer<int>(3);
  });
  tearDown(() {
    ringBuffer = null;
  });
  test('make empty ring buffer', () {
    expect(ringBuffer?.isEmpty, true);
  });
  test('write and read elements', () {
    ringBuffer?.write(1);
    ringBuffer?.write(2);

    expect(ringBuffer?.read(), 1);
    expect(ringBuffer?.read(), 2);
    expect(ringBuffer?.read(), null);
  });
  test('write more than lenth', () {
    ringBuffer?.write(1);
    ringBuffer?.write(2);
    ringBuffer?.write(3);

    expect(ringBuffer?.write(4), false);
  });
  test('isFull', () {
    ringBuffer?.write(1);
    ringBuffer?.write(2);
    ringBuffer?.write(3);

    expect(ringBuffer?.isFull, true);
  });
  test('isEmpty', () {
    ringBuffer?.write(1);
    ringBuffer?.write(2);
    ringBuffer?.write(3);

    ringBuffer?.read();
    ringBuffer?.read();
    ringBuffer?.read();

    expect(ringBuffer?.isEmpty, true);
  });
}
