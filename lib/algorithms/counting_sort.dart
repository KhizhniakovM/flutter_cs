// Not very good for big numbers, but can be good for small lists with small numbers
List<int> countingSort(List<int> list) {
  List<int> result = List<int>.filled(list.length, 0);

  // Find biggest number in list
  // [1,3,4,2,0,1,0,2,3] => Biggest number is 4
  int maxNumber = max(list);

  // Make list with maxNumber + 1 zeroes.
  List<int> countList = List<int>.filled(maxNumber + 1, 0);

  // Count all numbers in list
  // list [1,3,4,2,0,1,0,2,3]
  // countList [0,0,0,0,0]
  for (int element in list) {
    countList[element]++;
  }
  // countList [2,2,2,2,1]

  // Count position of number in new list
  for (int i = 1; i <= maxNumber; i++) {
    countList[i] += countList[i - 1];
  }
  // countList [2,4,6,8,9]

  for (int i = list.length - 1; i >= 0; i--) {
    result[countList[list[i]] - 1] = list[i];
    countList[list[i]]--;
  }

  return result;
}

int max(List<int> list) {
  int result = 0;
  for (int i in list) {
    if (i > result) {result = i;}
  }
  return result;
}