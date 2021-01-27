// Bitwise operators 

// Logical 'And' - &&
// Logical 'Or' - ||

// Logical 'No' - !

// ==================================================
// Bitwise operators for int 

// bitwise 'Or' - |
// 1 | 1 = 1
// 1 | 0 = 1
// 0 | 1 = 1
// 0 | 0 = 0

// bitwise 'And' - &
// 1 & 1 = 1
// 1 & 0 = 0
// 0 & 1 = 0
// 0 & 0 = 0

// XOR 'Exclusive-or' - ^
// 1 ^ 1 = 0
// 1 ^ 0 = 1
// 0 ^ 1 = 1
// 0 ^ 0 = 0

// ==================================================
// Fastest division on 2 and powers of 2
// Left Shift <<
// Right Shift >>



void main() {
  // ==================================================
  int result = 100 | 10; // Convert to binary numbers and use logical-or 'bit-by-bit'
  print('result == $result'); // result == 110

  int result1 = 25 | 10;
  print('result1 == $result1'); // result1 == 27

  // ==================================================
  int result2 = 100 & 10;
  print('result2 == $result2'); // result2 == 0

  int result3 = 25 & 10;
  print('result3 == $result3'); // result3 == 8

  // ==================================================
  int result4 = 100 ^ 10;
  print('result4 == $result4'); // result4 == 110

  int result5 = 25 ^ 10;
  print('result5 == $result5'); // result5 == 19

  // ==================================================
  int result6 = 13 << 1; // Left shift for 1 is equal to (int * 2), but mush faster
  print('result6 == $result6'); // result6 == 26

  int result7 = 13 << 3;
  print('result7 == $result7'); // result7 == 104; result7 == ((13 * 2) * 2) * 2

  // ==================================================
  int result8 = 25 >> 1; // Right shift for 1 is equal to (int / 2) with rounding, but much faster
  print('result8 == $result8'); // result8 == 12

  int result9 = 36 >> 2;
  print('result9 == $result9'); // result9 == 9; result9 == ((36 / 2) / 2)

  // ==================================================
  // Chessboard has 64 squares like int in Dart has bits.
  // => You can see every position on chessboard like one int.
  // ==================================================
  // NOTE: - In Dart you can use int only less than 2^53

  int x = 1 << 16; // int x == 1 << number_of_board_square
 
  // Number, that describes vertical column. It means all squares except this vertical is 1.
  int nA = 0xFEFEFEFEFEFEFEFE; // Left vertical column
  int nH = 0x7F7F7F7F7F7F7F7F; // Right vertical column
  int nB = 0xFDFDFDFDFDFDFDFD;
  int nG = 0xBFBFBFBFBFBFBFBF;

  // This method helps us to count the number of available for move squares.
  int countOfSquares(int value) {
    int result = 0;
    while (value > 0) {
      result++;
      value &= (value - 1);
    }
    return result;
  }

  // King Bits. Possible King moves
  int result10 = 
  ((x & nH) << 1) | ((x & nA) >> 1) | 
  ((x & nH) >> 7) | (x >> 8) | ((x & nA) >> 9) | 
  ((x & nA) << 7) | (x << 8) | ((x & nH) << 9);
  print('result10 == $result10');

  // Knight Bits. Possible Knight moves.
  int result11 = 
  ((x & (nA & nB)) << 6) | ((x & (nH & nG)) << 10) | ((x & nA) << 15) | ((x & nH) << 17) | 
  ((x & (nH & nG)) >> 6) | ((x & (nA & nB)) >> 10) | ((x & nH) >> 15) | ((x & nA) >> 17);
  print('result11 == $result11');
  print(countOfSquares(result11));

  // ==================================================
  // Very interesting FEN notation for chess 
  // TODO: - Try to solve tasks for this theme.
}