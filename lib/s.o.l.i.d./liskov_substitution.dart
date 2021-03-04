// MARK: - Простое определение
// Подтипы должны быть совместимы со своими базовыми типами.

// MARK: - Проблема контрактов
abstract class ITriple {
  int triple(int a); 
}
// У нас есть класс, который мы использовали в нашей первой версии приложения.
class TripleFirst extends ITriple {
  int triple(int a) => a * a * a;
}
// Во второй версии приложения мы изменили реализацию метода, 
// добавив некоторые предусловия.
class TripleSecond extends TripleFirst {
  @override 
  int triple(int a) {
    if (a > 0) {
      a = a * a * a;
    }
    return a;
  }
}
// При одних и тех-же входных данных мы получаем разные результаты 
// у класса и его подклассов. Налицо прямое нарушение принципа LSP.
void main() {
  ITriple tripleClass = TripleFirst();

  int a = -5;
  int result1 = tripleClass.triple(a);

  tripleClass = TripleSecond();
  int result2 = tripleClass.triple(a);

  print('result1 = $result1');
  print('result2 = $result2');
}
// ```
// result1 = -125
// result2 = -5
//```

// MARK: - Проблема ковариантов
