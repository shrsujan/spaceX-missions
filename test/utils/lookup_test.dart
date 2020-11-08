import 'package:flutter_test/flutter_test.dart';

import 'package:spaceX/utils/lookup.util.dart';

void main() {
  group('lookup.util', () {
    group('lookup', () {
      test(
          'should return null if provided map does not contain any of the keys down the hierarchy',
          () {
        final testMap = {
          'one': {
            'two': {
              'three': '3',
            }
          }
        };

        expect(lookup(testMap, ['one', 'two', 'three']), '3');
      });

      test('should return final value in the map if the keys exist', () {
        final three = '3';
        final two = {'three': three};
        final one = {'two': two};
        final testMap = {'one': one};

        expect(lookup(testMap, ['one']), one);
        expect(lookup(testMap, ['one', 'two']), two);
        expect(lookup(testMap, ['one', 'two', 'three']), three);
      });
    });
  });
}
