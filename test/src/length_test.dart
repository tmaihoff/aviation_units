// ignore_for_file: prefer_const_constructors

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

void main() {
  group('Length test:', () {
    test('zero', () {
      const zero = Length.zero;
      expect(zero.ft, 0);
      expect(zero.m, 0);
      expect(zero.km, 0);
      expect(zero.nm, 0);
    });

    test('si', () {
      expect(Length.fromSi(100), const Length(m: 100));
    });

    test('from', () {
      const m = Length(m: 100);
      expect(m.m, 100);

      const km = Length(km: 100);
      expect(km.m, 100000);

      const ft = Length(ft: 100);
      expect(ft.m, 30.48);

      const nm = Length(nm: 100);
      expect(nm.m, 185200);
    });

    test('as', () {
      const m = Length(m: 100);
      expect(m.m, 100);
      expect(m.km, 0.1);
      expect(m.ft, closeTo(328.084, 0.0001));
      expect(m.nm, closeTo(0.0539957, 0.0000001));
    });

    test('to and from json', () {
      expect(Length.fromJson({'type': 'Length', 'si': 1}), Length(m: 1));
      expect(Length(m: 2).toJson(), {'type': 'Length', 'si': 2});
      expect(Length.fromJson(Length(m: 1).toJson()), Length(m: 1));
    });
  });
}
