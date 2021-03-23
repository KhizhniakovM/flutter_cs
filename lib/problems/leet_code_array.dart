// MARK: - Permutations
Set<List<int>> permute(List<int> list) {
  Set<List<int>> result = {};
  if (list.length == 0) { return result; }

  List<bool> used = List<bool>.filled(list.length, false);
  List<int> permutation = List<int>.empty(growable: true);

  void helper() {
    if (permutation.length == list.length) {
      result.add(List<int>.from(permutation)); // Very important, when you have reference type
      return;
    }
    for (int i = 0; i < list.length; i++) {
      if (used[i]) { continue; }
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