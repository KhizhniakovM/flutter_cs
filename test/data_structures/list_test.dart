import 'package:flutter_cs/data_structures/list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // MARK: - Properties
  SingleList<int> singleList = SingleList<int>();
  VectorList<int> vectorList = VectorList<int>(10);
  FactorList<int> factorList = FactorList<int>();

  tearDown(() {
    singleList = SingleList<int>();
    vectorList = VectorList<int>(10);
    factorList = FactorList<int>();
  });

  group('Single list', () {
    test('create empty singleList', () {
      expect(singleList.size(), 0);
    });
    test('add new element to singleList', () {
      singleList.add(1);

      expect(singleList.size(), 1);
      expect(singleList.get(0), 1);
    });
    test('add some elements to singleList', () {
      for (int i = 0; i < 1000; i++) {
        singleList.add(i);
      }

      expect(singleList.size(), 1000);
      expect(singleList.get(998), 998);
    });
    test('remove element from singleList', () {
      singleList.add(1);
      singleList.removeAt(0);

      expect(singleList.size(), 0);
    });
    test('remove some elements from singleList', () {
      singleList.add(1);
      singleList.add(2);
      singleList.add(3);
      singleList.removeAt(1);

      expect(singleList.size(), 2);
      expect(singleList.get(0), 1);
      expect(singleList.get(1), 3);
    });
  });
  // ==================================================
  group('Vector list', () {
    test('create empty vectorList', () {
      expect(vectorList.size(), 0);
    });
    test('add new element to vectorList', () {
      vectorList.add(1);

      expect(vectorList.size(), 1);
      expect(vectorList.get(0), 1);
    });
    test('add some elements to vectorList', () {
      for (int i = 0; i < 1000; i++) {
        vectorList.add(i);
      }

      expect(vectorList.size(), 1000);
      expect(vectorList.get(998), 998);
    });
    test('remove element from vectorList', () {
      vectorList.add(1);
      expect(vectorList.trueSize(), 10);
      vectorList.removeAt(0);
      expect(vectorList.size(), 0);
      expect(vectorList.trueSize(), 0);
    });
    test('remove some elements from vectorList', () {
      vectorList.add(1);
      vectorList.add(2);
      vectorList.add(3);
      vectorList.removeAt(1);

      expect(vectorList.size(), 2);
      expect(vectorList.get(0), 1);
      expect(vectorList.get(1), 3);
      expect(vectorList.trueSize(), 10);
    });
  });
  // ==================================================
  group('Factor list', () {
    test('create empty factorList', () {
      expect(factorList.size(), 0);
    });
    test('add new element to factorList', () {
      factorList.add(1);

      expect(factorList.size(), 1);
      expect(factorList.get(0), 1);
    });
    test('add some elements to factorList', () {
      for (int i = 0; i < 1000; i++) {
        factorList.add(i);
      }

      expect(factorList.size(), 1000);
      expect(factorList.get(998), 998);
    });
  });
}
