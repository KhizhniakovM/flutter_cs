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