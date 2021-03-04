// Find missing int in list with n elements from 0 to n without result number
int missingNumber(List<int> list) {
  int expectedSum = list.length;
  int realSum = 0;

  for (int tmp = 0; tmp < list.length; tmp++) {
    expectedSum += tmp;
    realSum += list[tmp];
  }

  return expectedSum - realSum;
}

int duplicateNumber(List<int> list) {
  Map<int, int> map = Map<int, int>();

  for (int number in list) {
    if (map[number] != null) {
      return number;
    }
    map[number] = 1;
  }
  return 0;
}