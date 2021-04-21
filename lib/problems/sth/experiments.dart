// Set or Sort
// We need to find count of similar numbers in list

Future<int> findCountOfSimilarNumbersSet(List list) async =>
    await (list.length - Set<int>.from(list).length);
Future<int> findCountOfSimilarNumbersSort(List list) async {
  int result = 0;

  list.sort();
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] == list[i + 1]) result++;
  }
  return await result;
}
