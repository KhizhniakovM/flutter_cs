// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';
// void main() {
//   late FlutterDriver driver;

//   setUpAll(() async {
//     driver = await FlutterDriver.connect();
//   });

//   tearDownAll(() {
//     driver.close();
//   });

//   test('integration test', () async {
//     await driver.tap(find.byValueKey('textfield'));
//     await driver.enterText('I find it');
//     await driver.waitFor(find.text('abc'));
//   });

//   // To start:
//   // flutter driver 
//   // --target=test_driver/widget_app.dart 
//   // --driver=test_driver/widget_app_test.dart
// }