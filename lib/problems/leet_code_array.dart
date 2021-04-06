// MARK: - Permutations
Set<List<int>> permute(List<int> list) {
  Set<List<int>> result = {};
  if (list.length == 0) {
    return result;
  }

  List<bool> used = List<bool>.filled(list.length, false);
  List<int> permutation = List<int>.empty(growable: true);

  void helper() {
    if (permutation.length == list.length) {
      result.add(List<int>.from(
          permutation)); // Very important, when you have reference type
      return;
    }
    for (int i = 0; i < list.length; i++) {
      if (used[i]) {
        continue;
      }
      used[i] = true;
      permutation.add(list[i]);
      helper();
      permutation.removeLast();
      used[i] = false;
    }
  }

  helper();

  return result;
}

// MARK: - Max part of array
List<int> findMaxPartOfList(List<int> list) {
  List<int>? result;
  int sum = 0;

  for (int i = 0; i < list.length; i++) {
    for (int j = i + 1; j < list.length; j++) {
      int tmpSum = 0;
      int tmpI = i;

      while (tmpI < j) {
        tmpSum += list[tmpI];
        tmpI++;
      }
      if (tmpSum > sum) {
        sum = tmpSum;
        result = list.sublist(i, j);
      }
    }
  }
  return result!;
}

// MARK: - Find max part of array (log n)

