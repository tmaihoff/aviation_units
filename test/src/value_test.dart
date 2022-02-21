// ignore_for_file: prefer_const_constructors

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

void main() {
  group('value content test:', () {
    test('operations', () {
      expect((Angle.fromSi(1) + Angle.fromSi(2)).si, 3);
      expect((Angle.fromSi(3) - Angle.fromSi(2)).si, 1);
      expect(Angle.fromSi(2) * 3, Angle.fromSi(6));
      expect(Angle.fromSi(3) / 2, Angle.fromSi(1.5));
      expect(-Angle.fromSi(3), Angle.fromSi(-3));
      expect(Angle.fromSi(2) > Angle.fromSi(1), true);
      expect(Angle.fromSi(2) >= Angle.fromSi(1), true);
      expect(Angle.fromSi(2) >= Angle.fromSi(2), true);
      expect(Angle.fromSi(2) < Angle.fromSi(1), false);
      expect(Angle.fromSi(2) <= Angle.fromSi(1), false);
      expect(Angle.fromSi(2) <= Angle.fromSi(2), true);
      expect(Angle.fromSi(2) <= Angle.fromSi(2), true);
      expect(Angle.fromSi(2) == Angle.fromSi(1), false);
      expect(Angle.fromSi(2) == Angle.fromSi(2), true);
      expect(Angle.fromSi(11) % 10, Angle.fromSi(1));
    });

    test('hashcode', () {
      expect(Angle.fromSi(1).hashCode, Angle.fromSi(1).hashCode);
      expect(Angle.fromSi(1).hashCode, isNot(Length.fromSi(1).hashCode));
    });

    test('compareTo', () {
      expect(Angle.fromSi(1).compareTo(Angle.fromSi(2)), -1);
      expect(Angle.fromSi(1).compareTo(Angle.fromSi(1)), 0);
      expect(Angle.fromSi(2).compareTo(Angle.fromSi(1)), 1);
    });

    test('abs', () {
      expect(Angle.fromSi(-1).abs(), Angle.fromSi(1));
      expect(Angle.fromSi(1).abs(), Angle.fromSi(1));
    });
  });
}
