import 'package:flutter_cs/problems/ya_practice/video/video_1.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('playlists', () {
    test('1', () {
      List<int> result = makeOnePlaylistFromTwo(3, [1,2,3], [4,5,6]);
      expect(result, [1,4,2,5,3,6]);
    });
    test('2', () {
      List<int> result = makeOnePlaylistFromTwo(0, [], []);
      expect(result, []);
    });
  });
  group('simple encrypt', () {
    test('1', () {
      int result = simpleEncrypt(123);
      expect(result, 321);
    });
    test('2', () {
      int result = simpleEncrypt(-150);
      expect(result, -51);
    });
  });
  group('find id', () {
    test('1', () {
      List<int> result = findId(7, [6,4,1,2,3]);
      expect(result, [5,7]);
    });
  });
}