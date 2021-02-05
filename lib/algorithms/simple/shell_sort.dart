// Runtime - O(n^1.5)
// Memory - O(1)

// TODO: - find info about it
List shellSort(List list) {
  for (int gap = list.length ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = 0; i + gap < list.length; i++) {
      int j = i + gap;
      int tmp = list[j];
      while (j - gap >= 0 && list[j - gap] > tmp) {
        list[j] = list[j - gap];
        j -= gap; 
      }
      list[j] = tmp;
    }
  }
  return list;
}