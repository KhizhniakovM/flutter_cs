// А. Значения функции
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
}
