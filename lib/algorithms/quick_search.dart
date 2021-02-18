// Quick search of median
// This algorithm is using, when you want to find median of your list 

int medianSearch(List list) {
  list.sort();
  if (list.length % 2 == 1) { return list[list.length ~/ 2];}
  return (0.5 * (list[list.length ~/ 2 - 1] + list[list.length ~/ 2])).toInt();
}
int pickPivot(List list) {
  if (list.length < 5) { return medianSearch(list); }
  List chunks = chunked(list, 5);
  chunks.forEach((chunk) => chunk.sort());
  chunks = chunks.where((chunk) => chunk.length == 5).toList();
  List medians = chunks.map((chunk) => chunk[2]).toList();
  int medianOfMedians = medianSearch(medians);
  return medianOfMedians;
}
List chunked(List list, int lenght) {
  List result = [];
  for (var i = 0; i < list.length; i += lenght) {
    result.add(list.sublist(i, ((i + lenght) < list.length) ? (i + lenght) : (list.length) ));
  }
  return result;
}

int quickSearch(List list, int k) {
  if (list.length == 1) { return list[0]; }
  int pivot = pickPivot(list);

  List lows = list.where((element) => element < pivot).toList();
  List highs = list.where((element) => element > pivot).toList();
  List pivots = list.where((element) => element == pivot).toList();

  if (k < lows.length) {
      return quickSearch(lows, k);
  } else if (k < (lows.length + pivots.length)) {
      return pivots[0];
  } else {
      return quickSearch(highs, k - lows.length - pivots.length);
  }
}