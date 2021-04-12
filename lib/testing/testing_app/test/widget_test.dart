import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/widget.dart';
import 'package:mockito/mockito.dart';

// We can use mockito and it has some good methods like when
class MockSomeClass extends Mock implements SomeClass {}
void main() {
  late MockSomeClass someClass;

  setUp(() {
    someClass = MockSomeClass();
  });
  group('MyApp', () {
    testWidgets('MyApp has 1 MyWidget', (tester) async {
      // Create widget
      await tester.pumpWidget(MyApp());
      expect(find.byType(MyWidget), findsNWidgets(1));
    });
    testWidgets('write sth in testfield', (tester) async {
      await tester.pumpWidget(MyApp());
      await tester.enterText(find.byType(TextField), 'I find it');

      // Tester can make many things with widget
      // like tester.tap(finder)

      // Go to next frame
      // await tester.pump();
      //
      // Wait intil frame stop to change
      // await tester.pumpAndSettle();

      expect(find.text('abc'), findsOneWidget);
    });
  });
  // We can test little widget in isolation
  // But you need to wrap it in scaffold and material app
  group('TextButton', () {
    testWidgets('test widget with mock', (tester) async {
      // Mockito 
      // We write method and its return value as we want
      // when(someClass.makeSth()).thenReturn(10);
      
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: MyWidget(MockSomeClass()))));
      await tester.enterText(find.byType(TextField), 'I find it');

      expect(find.text('abc'), findsOneWidget);
    });
  });
}
