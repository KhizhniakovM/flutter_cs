import 'dart:async';
import 'dart:io';
// import 'dart:isolate';

void main() async {
  try {
    await someLongMethod().timeout(const Duration(milliseconds: 350));
  } on TimeoutException {
    print('TimeOut exception');
    // Если нужно точно прекратить выполнение операции, то самый действенный
    // способ - это убить изолят
    exit(2);
    // or 
    // Isolate.current.kill();
  }
}

Future<void> someLongMethod() async {
  final periodic = Stream<int>.periodic(const Duration(milliseconds: 250), (i) => i);
  await periodic.take(5).forEach(print);
}

// 0
// TimeOut exception 
// 1
// 2
// 3
// 4
