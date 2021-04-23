// MARK: - Playlist
// Есть два плейлиста, нужно совместить их в один, при этом чтобы композиции
// из разных плейлистов чередовались.
List<int> makeOnePlaylistFromTwo(
    int countOfSongs, List<int> first, List<int> second) {
  List<int> result = [];
  if (countOfSongs == 0) return result;
  for (int i = 0; i < countOfSongs; i++) {
    result.add(first[i]);
    result.add(second[i]);
  }
  return result;
}

// MARK: - Simple encrypt
// Нужно создать простейший алгоритм шифровки, который будет просто записывать
// число задом наперед
int simpleEncrypt(int number) {
  int result = int.parse(number
      .abs()
      .toString()
      .split('')
      .reversed
      .skipWhile((value) => value == 0)
      .toList()
      .join());
  return number.isNegative ? -result : result;
}

// MARK: - Find id
// Нужно определить id пользователей, которые не заходили на сайт
// Их всегда 2
List<int> findId(int numberOfUsers, List<int> listOfUsers) {
  Set<int> result = Set<int>.from(Iterable<int>.generate(numberOfUsers + 1));
  result
    ..remove(0)
    ..removeAll(listOfUsers);
  return List<int>.from(result);
}
