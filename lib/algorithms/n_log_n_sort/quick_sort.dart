// Runtime - O(n log n)
// Memory - O(1)

void quickSort(List list, int left, int right) {
  int partition(List list, int left, int right) {
  void swap(int a, int b) {
    var tmp = list[a];
    list[a] = list[b];
    list[b] = tmp;
  }

  int i = left - 1;
  int pivot = list[right];

  for (int j = left; j <= right; j++) {
    if (list[j] <= pivot) {
      i++;
      swap(j, i);
    }
  }
  return i;
}

  if (left >= right) { return; }
  int center = partition(list, left, right);
  quickSort(list, left, center - 1);
  quickSort(list, center + 1, right);
}


