// MARK: - Find majority element of list.
int majorityElement(List<int> list) {
  // NOTE: - Boyer-Moore Voting Algorithm
  int candidate = 0;
  int counter = 0;

  for (int i in list) {
    if (counter == 0) {
      candidate = i;
    }

    counter += (candidate == i) ? 1 : -1;
  }

  return candidate;
}

// MARK: - Move zeroes to the end of the list
void moveZeroes(List<int> list) {
  int pos = 0;

  for (int i = 0; i < list.length; i++) {
    if (list[i] != 0) {
      var tmp = list[pos];
      list[pos] = list[i];
      list[i] = tmp;
      pos++;
    }
  }
}

// MARK: - Conver roman to integer
int romanToInteger(String string) {
  int result = 0;
  Map<String, int> map = {
    "M": 1000,
    "D": 500,
    "C": 100,
    "L": 50,
    "X": 10,
    "V": 5,
    "I": 1
  };

  List<String> list = string.split("");
  for (int index = 0; index < list.length - 1; index++) {
    if (map[list[index]]! >= map[list[index + 1]]!) {
      result += map[list[index]]!;
    } else {
      result -= map[list[index]]!;
    }
  }
  result += map[list[list.length - 1]]!;

  return result;
}

// MARK: - Pascal's triangle
List<List<int>> pascalsTriangle(int count) {
  List<List<int>> result = [];

  List<int> first = [1];
  result.add(first);

  for (int i = 1; i < count; i++) {
    List<int> row = [];
    List<int> previousRow = result[i-1];

    row.add(1);
    for (int j = 1; j < i; j++) {
      row.add(previousRow[j] + previousRow[j-1]);
    }
    row.add(1);

    result.add(row);
  }

  return result;
}