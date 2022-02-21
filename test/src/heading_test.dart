import 'dart:math';

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

import 'test_utils.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  group('Heading test:', () {
    test('zero', () {
      const zero = Heading.zero;
      expect(zero.deg, 0);
      expect(zero.rad, 0);
    });

    test('si', () {
      expect(Heading.fromSi(100), const Heading(rad: 100));
    });

    test('value interval', () {
      const minus90 = Heading(deg: -90);
      const zero = Heading.zero;
      const plus90 = Heading(deg: 90);
      const plus360 = Heading(deg: 360);
      const plus370 = Heading(deg: 370);

      expect(minus90.deg, moreOrLessEquals(360 - 90));
      expect(zero.deg, 0);
      expect(plus90.deg, moreOrLessEquals(90));
      expect(plus360.deg, moreOrLessEquals(0));
      expect(plus370.deg, moreOrLessEquals(10));

      expect(Heading(rad: -pi).rad, Heading(rad: pi).rad);
      expect(Heading(rad: 7 * pi).rad, Heading(rad: pi).rad);
    });

    test('as integer', () {
      const h1p3 = Heading(deg: 1.3);
      const h1p6 = Heading(deg: 1.6);
      const h359p9 = Heading(deg: 359.9);
      expect(h1p3.asDegRoundedInt(), 1);
      expect(h1p6.asDegRoundedInt(), 2);
      expect(h359p9.asDegRoundedInt(), 360);
    });

    test('diff', () {
      var diff = Heading(deg: 300) - Heading(deg: 250);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 50).deg));

      diff = Heading(deg: 200) - Heading(deg: 250);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -50).deg));

      diff = Heading(deg: 350) - Heading(deg: 10);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -20).deg));

      diff = Heading(deg: 10) - Heading(deg: 350);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 20).deg));
    });

    test('plus', () {
      expect(
        Heading(deg: 30).plus(deg: 20).deg,
        moreOrLessEquals(Heading(deg: 50).deg),
      );
      expect(
        Heading(rad: pi).plus(rad: pi).rad,
        moreOrLessEquals(Heading(rad: 2 * pi).rad),
      );
    });

    test('minus', () {
      expect(
        Heading(deg: 30).minus(deg: 20).deg,
        moreOrLessEquals(Heading(deg: 10).deg),
      );
      expect(
        Heading(rad: pi).minus(rad: 2 * pi).rad,
        moreOrLessEquals(Heading(rad: -pi).rad),
      );
    });

    test('opposite', () {
      expect(Heading.zero.opposite.deg, Heading(deg: 180).deg);
      expect(Heading(deg: -90).opposite.deg, Heading(deg: 90).deg);
      expect(Heading(deg: 270).opposite.deg, Heading(deg: 90).deg);
    });

    test('range of random factory', () {
      for (var i = 0; i < 10000; i++) {
        expect(Heading.randomInt().deg, inInclusiveRange(0, 360));
      }
    });

    test('to and from json', () {
      expect(Heading.fromJson({'type': 'Heading', 'si': 1}), Heading(rad: 1));
      expect(Heading(rad: 2).toJson(), {'type': 'Heading', 'si': 2});
      expect(Heading.fromJson(Heading(rad: 1).toJson()), Heading(rad: 1));
    });
  });
}
