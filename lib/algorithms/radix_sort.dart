void radixSort(List<int> list, int radix) {
  int digit = 1;
  int index = 0;
  bool done = false;

  while (done == false) {
    done = true;
    List<List<int>> buckets = List<List<int>>.empty(growable: true);

    
    for (int i = 1; i <= radix; i++) {
      buckets.add(List<int>.empty(growable: true));
    }
    for (int num in list) {
      index = num ~/ digit;
      buckets[index % radix].add(num);
      if (done == true && index > 0) {
        done = false;
      }
    }

    var i = 0;
    for (int j = 0; j < radix; j++) {
      List<int> bucket = buckets[j];
      for (int num in bucket) {
        list[i] = num;
        i += 1;
      }
    }
    digit *= radix;
  }
}
