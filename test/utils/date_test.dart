import 'package:flutter_test/flutter_test.dart';

import 'package:spaceX/utils/date.util.dart';

void main() {
  group('date.util', () {
    group('formattedDateTime', () {
      final testDateTime = '2006-03-24T22:30:00.000Z';

      test(
          'should return an empty string when provided with a null dateTime argument',
          () {
        expect(formattedDateTime(dateTime: null), '');
      });

      test(
          'should return an empty string when provided with invalid date format',
          () {
        expect(formattedDateTime(dateTime: 'not a dateTime object'), '');
      });

      test(
          'should return a formatted date and time string when provided valid date',
          () {
        final expectedResponse = '3/24/2006 22:30:00';

        expect(formattedDateTime(dateTime: testDateTime), expectedResponse);
      });

      test(
          'should return a formatted date only string when provided valid date and false for showTime argument',
          () {
        final expectedResponse = '3/24/2006';

        expect(formattedDateTime(dateTime: testDateTime, showTime: false),
            expectedResponse);
      });
    });
  });
}
