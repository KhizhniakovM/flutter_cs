// Runtime - O(n^2)
// Memory - O(1)

void selectionSort(List list) {
  void swap(int a, int b) {
    var tmp = list[a];
    list[a] = list[b];
    list[b] = tmp;
  }
  if (list.length < 2) { return; }
  for (int i = 0; i < list.length; i++) {
    int lowest = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[j] < list[lowest]) {
        lowest = j;
      }
    }
    if (i != lowest) {
      swap(i, lowest);
    }
  }
}