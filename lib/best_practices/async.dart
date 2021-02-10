import 'dart:async';

void main() {
  print('Start main');

  // makeAsyncWithFuture();
  // makeAsyncWithAsyncAwait();
  // makeAsyncWithStream();
makeAsynWithBroadcastStream();

  print('Finish main');
}
// ==================================================
// MARK: - Future
void makeAsyncWithFuture() {
  print('Start future method');
  Future.delayed(Duration(seconds: 2), () {
    return 100;
  }).then((value) {
    if (value == 100) {
      print('Result == $value');
    } else {
      throw Exception('Exception for test');
    }
  }).catchError((error) {
    print(error);
  });
  print('Complete future method');
}
// ==================================================
// MARK: - AsyncAwait
void makeAsyncWithAsyncAwait() async {
  print('Start asyncAwait method');
  try {
    int result = await _privateMethod();
    print('Result == $result');
  } catch (error) {
    print(error);
  }
  print('Finish asyncAwait method');
}
Future<int> _privateMethod() {
  int result = 100;

  if (result == 100) {
    return Future<int>.delayed(Duration(seconds: 2), () => result);
  } else {
    throw Exception('Exception for test');
  }
}
// ==================================================
// MARK: - Stream 
void makeAsyncWithStream() {
  print('Start stream method');

  final stream = Stream.fromIterable([1,2,3,4,5]);

  stream.listen((event) { 
    print('listen value = $event');
  });

  print('Finish stream method');
}

// ==================================================
// MARK: - BroadcastStream 
void makeAsynWithBroadcastStream() {
  print('Start stream method');
  final streamController = StreamController.broadcast();

  streamController.stream.listen((event) {
    print('listener 1 value = $event');
  });
  // NOTE: - Also you can use subscription to unsubscribe from stream
  StreamSubscription listener2 = streamController.stream.listen((event) { });
  listener2.onData((data) {
    print('listener 2 value = $data');
    if (data == 3) {
      listener2.cancel();
    }
  });

  streamController.sink.add(1);
  streamController.sink.add(2);
  streamController.sink.add(3);
  streamController.sink.add(4);
  streamController.sink.add(5);
  streamController.close();

  print('Finish stream method');
}