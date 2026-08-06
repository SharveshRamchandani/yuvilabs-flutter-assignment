import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:day1/main.dart';
import 'package:day1/widgets/bottom_navigation.dart';

void main() {
  testWidgets('FitnessAppDay1 renders header and BottomNavigation smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FitnessAppDay1());

    // Verify header title appears
    expect(find.text('Hello, Alex!'), findsOneWidget);

    // Verify BottomNavigation exists
    expect(find.byType(BottomNavigation), findsOneWidget);

    // Verify SVG pictures render (1 notification icon + 3 nav items)
    expect(find.byType(SvgPicture), findsAtLeastNWidgets(3));
  });
}
