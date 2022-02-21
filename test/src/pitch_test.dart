// ignore_for_file: prefer_const_constructors

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('Pitch test:', () {
    test('zero', () {
      const zero = Pitch.zero;
      expect(zero.deg, 0);
      expect(zero.rad, 0);
    });

    test('si', () {
      expect(Pitch.fromSi(100), const Pitch(rad: 100));
    });

    test('value interval', () {
      const zero = Pitch.zero;
      const plus45 = Pitch(deg: 45);
      const plus90 = Pitch(deg: 90);
      const plus150 = Pitch(deg: 150);
      const plus180 = Pitch(deg: 180);
      const plus200 = Pitch(deg: 200);
      const plus270 = Pitch(deg: 270);
      const plus360 = Pitch(deg: 360);
      const plus720 = Pitch(deg: 720);
      const minus45 = Pitch(deg: -45);
      const minus90 = Pitch(deg: -90);
      const minus150 = Pitch(deg: -150);
      const minus180 = Pitch(deg: -180);
      const minus270 = Pitch(deg: -270);
      const minus360 = Pitch(deg: -360);

      expect(zero.deg, moreOrLessEquals(0));
      expect(plus45.deg, moreOrLessEquals(45));
      expect(plus90.deg, moreOrLessEquals(90));
      expect(plus150.deg, moreOrLessEquals(30));
      expect(plus180.deg, moreOrLessEquals(0));
      expect(plus200.deg, moreOrLessEquals(-20));
      expect(plus270.deg, moreOrLessEquals(-90));
      expect(plus360.deg, moreOrLessEquals(0));
      expect(plus720.deg, moreOrLessEquals(0));
      expect(minus45.deg, moreOrLessEquals(-45));
      expect(minus90.deg, moreOrLessEquals(-90));
      expect(minus150.deg, moreOrLessEquals(-30));
      expect(minus180.deg, moreOrLessEquals(0));
      expect(minus270.deg, moreOrLessEquals(90));
      expect(minus360.deg, moreOrLessEquals(0));
    });

    test('to and from json', () {
      expect(Pitch.fromJson({'type': 'Pitch', 'si': 1}), Pitch(rad: 1));
      expect(Pitch(rad: 2).toJson(), {'type': 'Pitch', 'si': 2});
      expect(Pitch.fromJson(Pitch(rad: 1).toJson()), Pitch(rad: 1));
    });
  });
}
