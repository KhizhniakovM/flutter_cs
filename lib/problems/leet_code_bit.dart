int singleNumber(List<int> list) {
  int tmp = 0;
  for (int i in list) {
    tmp ^= i; // XOR operation. (Исключающее 'ИЛИ')
  }
  return tmp;
}