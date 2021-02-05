// Runtime - O(n^2)
// Memory - O(1)

List bubbleSort(List list) {
  for (var i = 0; i < list.length; i++) {
    for (var j = 1; j < list.length - i; j++) {
      if (list[j] < list[j - 1]) {
        var tmp = list[j - 1];
        list[j - 1] = list[j];
        list[j] = tmp;
      }
    }
  }
  return list;
}

// TODO: - Улучшения.
// 1. Если не было обменов, то прекратить итерации.
// 2.
