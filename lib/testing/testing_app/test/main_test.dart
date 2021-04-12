import 'package:test/test.dart';

import 'package:testing_app/main.dart';

void main() {
  // Set up once before all test run
  setUpAll(() {});
  // Set up before every test run
  setUp(() {});

  // Tear down once after all test finish
  tearDownAll(() {});
  // Tear down after every test finish
  tearDown(() {});

  // Matcher class
  // isNull, isTrue and many many others
  // You can make custom matcher
  //
  // ```
  // class Qqq extends CustomMatcher {
  //   Qqq(String featureDescription, String featureName, matcher)
  //       : super(featureDescription, featureName, matcher);
  // }
  // ```

  group('sum', () {
    test('1 + 5 = 6', () {
      expect(sum(1, 5), 6);
    });
  });

  group('divide', () {
    test('4 / 2 = 2', () {
      expect(divide(4, 2), 2);
    });
    test('4 / 0 => throw ArgumentError', () {
      // You need to check error like this: () =>
      expect(() => divide(4, 0), throwsArgumentError);
    });
  });

  group('future, power of two', () {
    test('2 * 2 = 4', () async {
      expect(await powerOfTwo(2), 4);
    });
  });

  group('stream, pi', () {
    test('pi', () {
      expect(pi(), emitsInOrder([3, 3.1, 3.14, 3.141, 3.1415]));
    });
  });
}
