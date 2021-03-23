// Runtime - O(n^2)
// Memory - O(1)

// + Very fast for almost sorted array

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

// Сортировка вставкой. 
// Похожа на сортировку карт из колоды в руку.

// NOTE: - Insertion sort without swap method
// It is faster, because make only one assignment instead of 3 in swap method
void insertSort(List<int> list) {
  for (int i = 1; i < list.length; i++) {
    int currentIndex = i;
    int tmp = list[currentIndex];

    while (currentIndex > 0 && tmp < list[currentIndex - 1]) {
      list[currentIndex] = list[currentIndex - 1];
      currentIndex--;
    }
    list[currentIndex] = tmp;
  }
}

// NOTE: - We can use binary search to find place for new number in sorted array, 
// but it will not much increase the efficiency of that algorithm