// MARK: - Reverse string 
String reverseString(String input) {
  var tmpString = input.split(''); 
  // It is necessary in dart language, because we can't use []= in String
  // That's why memory complexity can be lower than in other languages

  int first = 0;
  int last = input.length - 1;

  while (first < last) {
    var tmp = tmpString[first];
    tmpString[first] = tmpString[last];
    tmpString[last] = tmp;

    first++;
    last--;
  }
  return tmpString.join();
}

// MARK: - Valid anagram 
bool isAnagram(String first, String second) {
  var tmpFirst = first.split('');
  var tmpSecond = second.split('');
  var map = Map<String, int>();

  for (String i in tmpFirst) {
    if (map[i] == null) { map[i] = 1; } else {map[i] = map[i]! + 1;}
  }
  for (String i in tmpSecond) {
    if (map[i] == null) { map[i] = 1; } else {map[i] = map[i]! - 1;}
  }
  for (int i in map.values) {
    if (i != 0) { return false; }
  }
  return true;
}