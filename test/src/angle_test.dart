// ignore_for_file: use_named_constants

import 'dart:math';

import 'package:aviation_units/aviation_units.dart';
import 'package:shared_dart/shared_dart.dart';
import 'package:test/test.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  group('Angle test:', () {
    test('zero', () {
      const zero = Angle.zero;
      expect(zero.deg, 0);
      expect(zero.rad, 0);
    });

    test('si', () {
      expect(Angle.fromSi(100), const Angle(rad: 100));
    });

    test('unit conversion', () {
      const deg180 = Angle.deg180;
      expect(deg180.deg, 180);
      expect(deg180.rad, pi);

      const rad180 = Angle(rad: pi);
      expect(rad180.deg, 180);
      expect(rad180.rad, pi);

      const deg720 = Angle(deg: 720);
      expect(deg720.deg, 720);
      expect(deg720.rad, 4 * pi);

      const rad720 = Angle(rad: 4 * pi);
      expect(rad720.deg, 720);
      expect(rad720.rad, 4 * pi);
    });

    test('plus', () {
      expect(
        const Angle(deg: 20).plus(deg: 30).deg,
        moreOrLessEquals(const Angle(deg: 50).deg),
      );
      expect(
        const Angle(deg: -10).plus(deg: 30).deg,
        moreOrLessEquals(const Angle(deg: 20).deg),
      );
    });

    test('minus', () {
      expect(
        const Angle(deg: 20).minus(deg: 30).deg,
        moreOrLessEquals(const Angle(deg: -10).deg),
      );
      expect(
        const Angle(deg: 100).minus(deg: 50).deg,
        moreOrLessEquals(const Angle(deg: 50).deg),
      );
    });

    test('diff', () {
      var diff = Angle.diff(const Angle(deg: 30), const Angle(deg: -30));
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 60).deg));

      diff = Angle.diff(const Angle(deg: 30), const Angle(deg: 60));
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -30).deg));

      diff = Angle.diff(const Angle(deg: -30), const Angle(deg: -60));
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 30).deg));

      diff = Angle.diff(const Angle(deg: 160), const Angle(deg: -160));
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -40).deg));

      diff = Angle.diff(const Angle(deg: 180), const Angle(deg: 20));
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 160).deg));
    });

    test('interval 0 to 360 degrees', () {
      expect(Angle.zero.from0To360, Angle.zero);
      expect(const Angle(deg: -90).from0To360.deg,
          moreOrLessEquals(const Angle(deg: 270).deg));
      expect(const Angle(deg: -1).from0To360.deg,
          moreOrLessEquals(const Angle(deg: 359).deg));
      expect(const Angle(deg: 180).from0To360.deg,
          moreOrLessEquals(const Angle(deg: 180).deg));
      expect(const Angle(deg: 361).from0To360.deg,
          moreOrLessEquals(const Angle(deg: 1).deg));
      expect(const Angle(deg: 450).from0To360.deg,
          moreOrLessEquals(const Angle(deg: 90).deg));
    });

    test('interval -180 to 180 degrees', () {
      expect(const Angle(deg: -270).fromM180To180.deg,
          moreOrLessEquals(const Angle(deg: 90).deg));
      expect(const Angle(deg: -181).fromM180To180.deg,
          moreOrLessEquals(const Angle(deg: 179).deg));
      expect(Angle.zero.fromM180To180, Angle.zero);
      expect(const Angle(deg: 181).fromM180To180.deg,
          moreOrLessEquals(const Angle(deg: -179).deg));
      expect(const Angle(deg: 270).fromM180To180.deg,
          moreOrLessEquals(const Angle(deg: -90).deg));
    });

    test('to and from json', () {
      expect(Angle.fromJson({'type': 'Angle', 'si': 1}), Angle(rad: 1));
      expect(Angle(rad: 2).toJson(), {'type': 'Angle', 'si': 2});
      expect(Angle.fromJson(Angle(rad: 1).toJson()), Angle(rad: 1));
    });

    test('to string with decimals', () {
      expect(Angle(deg: 10).toStringWithDecimals(2), '10.00 °');
    });

    test('as rounded int', () {
      expect(Angle(deg: 10).asDegRoundedInt(), 10);
      expect(Angle(deg: 10.4).asDegRoundedInt(), 10);
      expect(Angle(deg: 9.6).asDegRoundedInt(), 10);
    });

    test('to 3 digits string', () {
      expect(Angle(deg: 1).degTo3DigitsString(), '001');
      expect(Angle(deg: 10).degTo3DigitsString(), '010');
      expect(Angle(deg: 100).degTo3DigitsString(), '100');
      expect(Angle(deg: 100.6).degTo3DigitsString(), '101');
    });
  });
}
