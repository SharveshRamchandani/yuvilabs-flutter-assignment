import 'package:flutter_test/flutter_test.dart';
import 'package:day0/main.dart';

void main() {
  testWidgets('Day 0 setup smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitnessApp());

    expect(find.text('Hello, Alex!'), findsOneWidget);
    expect(find.text('Fitness & Calorie Tracker'), findsOneWidget);
    expect(find.text('DAY 0 READY'), findsOneWidget);
  });
}
