import 'package:flutter_test/flutter_test.dart';

import 'package:spaceX/utils/string.util.dart';

void main() {
  group('string.util', () {
    group('interpolate', () {
      test('should return an empty string when provided with empty arguments',
          () {
        expect(interpolate('', {}), '');
      });

      test('should return the same string that is provided if values are empty',
          () {
        final testStr = 'v4/launches';

        expect(interpolate(testStr, {}), testStr);
      });

      test(
          'should return the same string that is provided if replacement values are not provided',
          () {
        final testStr = 'v4/rockets/:id';
        final testValues = {'rocketId': '5ewr7281'};

        expect(interpolate(testStr, testValues), testStr);
      });

      test(
          'should return the resolved string constructed by replacing substrings for every values argument in the provided string',
          () {
        final testStr = 'v4/rockets/:rocketId/launch/:launchId';
        final testValues = {'rocketId': '5ewr7281', 'launchId': '77e27882'};
        final expectedResult =
            'v4/rockets/${testValues['rocketId']}/launch/${testValues['launchId']}';

        expect(interpolate(testStr, testValues), expectedResult);
      });
    });
  });
}
