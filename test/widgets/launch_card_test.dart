import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spaceX/models/launch.model.dart';
import 'package:spaceX/widgets/launch_card.widget.dart';

void main() {
  testWidgets(
    'launch_card.widget should display a launch information in a card view',
    (WidgetTester tester) async {
      final testKey = Key('launch_card.widget');
      final LaunchModel testLaunch = LaunchModel.fromJson({});

      await tester.pumpWidget(LaunchCardWidget(
        key: testKey,
        launch: testLaunch,
      ));

      expect(find.byKey(testKey), findsOneWidget);
    },
  );
}
