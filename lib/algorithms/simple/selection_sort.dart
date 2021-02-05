// Runtime - O(n^2)
// Memory - O(1)

List selectionSort(List list) {
  if (list.length < 2) { return list; }
  for (int i = 0; i < list.length; i++) {
    int lowest = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[lowest]) {
        lowest = j;
      }
    }
    if (i != lowest) {
      var tmp = list[i];
      list[i] = list[lowest];
      list[lowest] = tmp;
    }
  }
  return list;
}