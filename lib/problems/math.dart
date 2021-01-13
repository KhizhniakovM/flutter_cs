import 'dart:math';
// ==================================================
/// The Euclidean algorithm. LCD of two numbers.
int lcd(int a, int b) {
  while (a > 0 && b > 0) {
    if (a > b) {
      a = a % b;
    } else {
      b = b % a;
    }
  }
  return max(a, b);
}

// ==================================================
/// The Al-Kashi algorithm. Exponentiation. 
int exponentiation({ required int base, required int power }) {
  int result = 1;
  while (power > 1) {
    if (power.remainder(2) == 1) { result *= base; }
    print('$base, $power');
    base *= base;
    power ~/= 2;
    print('$base, $power');
  }

  if (power > 0) { result *= base; }
  return result;
}

// ==================================================
// Check the number that it is prime. Not optimized
bool isPrime(int number) {
  if (number <= 2) return false;
  if (number == 2) return true;

  int max = sqrt(number).ceil();

  for (int i = 2; i <= max; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

// ==================================================
// Count of prime numbers until selected. O(log n).
int countOfPrimeNumbersUntil(int number) {
  Map<int, int> lp = <int, int>{};
  List<int> pr = [];

  for (var i = 2; i <= number; i++) {
    if (lp[i] == null) {
      lp[i] = i;
      pr.add(i);
    }
    for (var p in pr.where((element) => element <= lp[i]! && (element * i) <= number)) {
      lp[p * i] = p;
    }
  }
  
  return pr.length;
}