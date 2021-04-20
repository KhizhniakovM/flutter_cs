import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              TextButton(
                onPressed: () => impactOnEventLoop(),
                child: Text('Press me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> impactOnEventLoop() async {
  final totalTimer = Stopwatch()..start();
  final iterationTimer = Stopwatch()..start();
  final primeList = <int>[];
  final sourceData = generateSourceData(5000000).toList();

  for (final i in sourceData) {
    // Длительные синхронные операции замораживают наш ui
    // Изменения ui лежат на event-loop

    if (iterationTimer.elapsedMilliseconds > 16) {
      // Вставляя пустой future мы заставляем программу остановить выполнение
      // синхронной операции и выполнить следующие event's
      // (анимация и другое)
      // в конце которых и выполняется наш пустой future

      await Future<void>.delayed(Duration.zero);
      iterationTimer.reset();
    }

    if (!i.isPrime) continue;
    primeList.add(i);

    // Также можно после каждой итерации вставлять
    // await Future<void>.delayed(Duration.zero);
    // но производительность будет хуже
  }
  print('Stopwatch - ${totalTimer.elapsedMilliseconds}');
  print('Number of primes - ${primeList.length}');
  iterationTimer.stop();
  totalTimer.stop();
}

Iterable<int> generateSourceData(int count) sync* {
  for (int i = 0; i < count; i++) {
    yield i;
  }
}

extension Prime on int {
  bool get isPrime {
    if (this <= 2) return false;
    if (this == 2) return true;

    int max = sqrt(this).ceil();

    for (int i = 2; i <= max; i++) {
      if (this % i == 0) {
        return false;
      }
    }
    return true;
  }
}
