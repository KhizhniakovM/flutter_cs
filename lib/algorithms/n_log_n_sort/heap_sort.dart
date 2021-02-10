// Runtime - O(n log n)
// Memory - O(1)

void heapSort(List list) {
  // MARK: - Methods of swapping two elements
  void swap(int a, int b) {
    var tmp = list[a];
    list[a] = list[b];
    list[b] = tmp;
  }
  // MARK: - Method to make heap-list data structure from list
  void down(int size, int root) {
    int left = (root * 2) + 1;
    int right = left++;
    int result = root;

    if (left < size && list[left] > list[result]) { result = left; }
    if (right < size && list[right] > list[result]) { result = right; }
    if (result == root) { return; }

    swap(result, root);
    down(size, result);
  }
  
  for (int i = list.length ~/ 2 - 1; i >= 0; i--) {
    down(list.length, i);
  }
  
  for (int j = list.length - 1; j >= 0; j--) {
    swap(0, j);
    down(j, 0);
  }
}
