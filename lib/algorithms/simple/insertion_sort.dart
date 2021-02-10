// Runtime - O(n^2)
// Memory - O(1)

void insertionSort(List list) {
  void swap(int a, int b) {
    var tmp = list[a];
    list[a] = list[b];
    list[b] = tmp;
  }
  for (int i = 1; i < list.length; i++) {
    int currentIndex = i;
    while (currentIndex > 0 && list[currentIndex] < list[currentIndex - 1]) {
      swap(currentIndex, currentIndex - 1);
      currentIndex--;
    }
  }
}