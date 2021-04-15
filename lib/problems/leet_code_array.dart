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
// Make new class for our problem
class MaxSumRange {
  int start;
  int end;
  int maxSum;

  MaxSumRange(this.start, this.end, this.maxSum);
}

List<int> getMaxSumRange(List<int> list) {
  int currSum = 0;
  int startIndex = 0;
  MaxSumRange? maxSumRange;

  for (int endIndex = 0; endIndex < list.length; endIndex++) {
    currSum += list[endIndex];

    if (maxSumRange == null || currSum > maxSumRange.maxSum)
      maxSumRange = MaxSumRange(startIndex, endIndex, currSum);

    if (currSum < 0) {
      currSum = 0;
      startIndex = endIndex + 1;
    }
  }
  return list.sublist(maxSumRange!.start, maxSumRange.end + 1);
}

// MARK: - Max part of array (log n)

