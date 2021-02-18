
// MARK: - Find majority element of list. 
int majorityElement(List<int> list) {
  // NOTE: - Boyer-Moore Voting Algorithm 
  int candidate = 0;
  int counter = 0;

  for (int i in list) {
    if (counter == 0) { candidate = i; } 

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