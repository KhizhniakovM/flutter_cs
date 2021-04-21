import 'dart:math';

// MARK: - Find max sum of the part of array
// MARK: - 1 solution n^3

Future<int> findMaxSum1(List<int> list) async {
  int best = 0;

  for (int a = 0; a < list.length; a++) {
    for (int b = a; b < list.length; b++) {
      int sum = 0;
      for (int k = a; k <= b; k++) {
        sum += list[k];
      }
      best = max(best, sum);
    }
  }
  return await best;
}

// MARK: - 2 solution n^2
Future<int> findMaxSum2(List<int> list) async {
  int best = 0;

  for (int a = 0; a < list.length; a++) {
    int sum = 0;
    for (int b = a; b < list.length; b++) {
      sum += list[b];
      best = max(best, sum);
    }
  }
  return await best;
}

// MARK: - 3 solution n
Future<int> findMaxSum3(List<int> list) async {
  int best = 0;
  int sum = 0;

  for (int a = 0; a < list.length; a++) {
    sum = max(list[a], sum + list[a]);
    best = max(best, sum);
  }
  return await best;
}
