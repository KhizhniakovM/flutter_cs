// Runtime - O(n log n)
// Memory - O(1)

List mergeSort(List list) {
  List merge(List left, List right) {
    int leftIndex = 0, rightIndex = 0;

    List sortedList = [];

    while (leftIndex < left.length && rightIndex < right.length) {
      if (left[leftIndex] < right[rightIndex]) {
        sortedList.add(left[leftIndex]);
        leftIndex++;
      } else if (left[leftIndex] > right[rightIndex]) {
        sortedList.add(right[rightIndex]);
        rightIndex++;
      } else {
        sortedList.add(left[leftIndex]);
        leftIndex++;
        sortedList.add(right[rightIndex]);
        rightIndex++;
      }
    }

    while (leftIndex < left.length) {
      sortedList.add(left[leftIndex]);
      leftIndex++;
    }
    while (rightIndex < right.length) {
      sortedList.add(right[rightIndex]);
      rightIndex++;
    }

    return sortedList;
  }

  if (list.length < 2) return list;
  int middleIndex = list.length ~/ 2;

  List left = mergeSort(list.sublist(0, middleIndex));
  List right = mergeSort(list.sublist(middleIndex));

  return merge(left, right);
}
