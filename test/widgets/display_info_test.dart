import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spaceX/widgets/display_info.widget.dart';

void main() {
  testWidgets(
    'display_info.widget should display a title and a value',
    (WidgetTester tester) async {
      final String testTitle = 'A title';
      final String testValue = 'Some value';
      final testKey = Key('display_info.widget');

      await tester.pumpWidget(DisplayInfoWidget(
        key: testKey,
        title: testTitle,
        value: testValue,
      ));

      expect(find.byKey(testKey), findsOneWidget);
    },
  );
}
