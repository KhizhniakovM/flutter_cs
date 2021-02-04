import 'package:flutter_cs/data_structures/queue/queue_by_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // MARK: - Properties
  QueueByList? queue;
  // MARK: - SetUp & TearDown
  setUp(() {
    queue = QueueByList<int>();
  });
  tearDown(() {
    queue = null;
  });
  // MARK: - Test
  test('make queue', () {
    expect(queue?.isEmpty, true);
    expect(queue?.peek, null);
  });
  test('enqueue value', () {
    queue?.enqueue(5);
    queue?.enqueue(-7);

    expect(queue?.isEmpty, false);
    expect(queue?.length, 2);
    expect(queue?.peek, 5);
  });
    test('dequeue value', () {
    queue?.enqueue(-23);
    queue?.enqueue(1000);
    queue?.dequeue();

    expect(queue?.isEmpty, false);
    expect(queue?.length, 1);
    expect(queue?.peek, 1000);
  });

  test('dequeue many times', () {
    queue?.enqueue(100);
    queue?.dequeue();
    queue?.dequeue();

    expect(queue?.isEmpty, true);
  });
}