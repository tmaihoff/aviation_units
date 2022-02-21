import 'package:aviation_units/aviation_units.dart';
import 'package:shared_dart/shared_dart.dart';
import 'package:test/test.dart';

// ignore_for_file: prefer_const_constructors

void main() {
  group('Bank test:', () {
    test('zero', () {
      const zero = Bank.zero;
      expect(zero.deg, 0);
      expect(zero.rad, 0);
    });

    test('si', () {
      expect(Bank.fromSi(100), const Bank(rad: 100));
    });

    test('value interval', () {
      const minus270 = Bank(deg: -270);
      const minus180 = Bank(deg: -180);
      const minus90 = Bank(deg: -90);
      const zero = Bank.zero;
      const plus90 = Bank(deg: 90);
      const plus179 = Bank(deg: 179);
      const plus270 = Bank(deg: 270);

      expect(minus270.deg, moreOrLessEquals(90));
      expect(minus180.deg, moreOrLessEquals(-180));
      expect(minus90.deg, moreOrLessEquals(-90));
      expect(zero.deg, 0);
      expect(plus90.deg, moreOrLessEquals(90));
      expect(plus179.deg, moreOrLessEquals(179));
      expect(plus270.deg, moreOrLessEquals(-90));
    });

    test('diff', () {
      var diff = Bank(deg: 30) - Bank(deg: -30);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 60).deg));

      diff = Bank(deg: 30) - Bank(deg: 60);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -30).deg));

      diff = Bank(deg: -30) - Bank(deg: -60);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: 30).deg));

      diff = Bank(deg: 160) - Bank(deg: -160);
      expect(diff.deg, moreOrLessEquals(const Angle(deg: -40).deg));
    });

    test('to and from json', () {
      expect(Bank.fromJson({'type': 'Bank', 'si': 1}), Bank(rad: 1));
      expect(Bank(rad: 2).toJson(), {'type': 'Bank', 'si': 2});
      expect(Bank.fromJson(Bank(rad: 1).toJson()), Bank(rad: 1));
    });
  });
}
