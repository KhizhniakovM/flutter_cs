// Runtime - O(n^2)
// Memory - O(1)

List insertionSort(List list) {
  for (int i = 1; i < list.length; i++) {
    int currentIndex = i;
    while (currentIndex > 0 && list[currentIndex] < list[currentIndex - 1]) {
      var tmp = list[currentIndex];
      list[currentIndex] = list[currentIndex - 1];
      list[currentIndex - 1] = tmp;
      currentIndex--;
    }
  }
  return list;
}