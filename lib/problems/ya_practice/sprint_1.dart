// А. Значения функции
import 'dart:math';

class Sprint1 {
  int a(int a, int x, int b, int c) {
    return a * (x * x) + b * x + c;
  }

  List<int> b(List<int> list, int k) {
    Map<int, int> map = Map<int, int>();
    List<int> result = List<int>.empty(growable: true);

    for (int id in list) {
      map[id] ??= 0;
      map[id] = map[id]! + 1;
    }

    for (int num = 0; num < k; num++) {
      int biggest = 0;
      int id = 0;
      map.forEach((key, value) {
        if (value > biggest) {
          biggest = value;
          id = key;
        }
      });
      result.add(id);
      map[id] = 0;
    }

    return result;
  }

  List<int> c(int lenght, List<int> number, int k) {
    int tmp = 0;
    List<int> result = List<int>.empty(growable: true);

    for (int start = 0; start < lenght; start++) {
      tmp += number[start] * (pow(10, (lenght - 1 - start)).toInt());
    }

    tmp += k;

    while (tmp >= 1) {
      int i = tmp % 10;
      tmp = (tmp / 10).round();
      result.insert(0, i);
    }

    return result;
  }

  List<int> d(List<int> points) {
    points.removeWhere((element) => element == 0);
    return points;
  }

  // int e(int number) {
  //   int result = 0;

  //   while (number >= 1) {

  //   }
  // }
}
