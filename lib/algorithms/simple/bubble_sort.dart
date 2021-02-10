// Runtime - O(n^2)
// Memory - O(1)

void bubbleSort(List list) {
  void swap(int a, int b) {
    var tmp = list[a];
    list[a] = list[b];
    list[b] = tmp;
  }
  for (var i = 0; i < list.length; i++) {
    for (var j = 1; j < list.length - i; j++) {
      if (list[j] < list[j - 1]) {
        swap(j, j - 1);
      }
    }
  }
}

// TODO: - Улучшения.
// 1. Если не было обменов, то прекратить итерации.
// 2.
