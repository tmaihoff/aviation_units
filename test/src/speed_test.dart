// ignore_for_file: prefer_const_constructors

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

void main() {
  group('Speed test:', () {
    test('zero', () {
      const zero = Speed.zero;
      expect(zero.mps, 0);
      expect(zero.kmh, 0);
      expect(zero.kt, 0);
    });

    test('si', () {
      expect(Speed.fromSi(100), const Speed(mps: 100));
    });

    test('from', () {
      const tolerance = 0.0001;

      const mps = Speed(mps: 100);
      expect(mps.mps, 100);

      const kmh = Speed(kmh: 100);
      expect(kmh.mps, closeTo(27.7778, tolerance));

      const kt = Speed(kt: 100);
      expect(kt.mps, closeTo(51.4444, tolerance));

      const ftpmin = Speed(ftpm: 100);
      expect(ftpmin.mps, closeTo(0.508, tolerance));
    });

    test('as', () {
      const mps = Speed(mps: 100);
      expect(mps.mps, 100);
      expect(mps.kmh, closeTo(360, 0.0001));
      expect(mps.kt, closeTo(194.384, 0.001));
      expect(mps.ftpm, closeTo(19685, 0.1));
    });

    test('range of random factory', () {
      for (var i = 0; i < 10000; i++) {
        expect(
          Speed.random(max: const Speed(mps: 1000)).mps,
          inExclusiveRange(0, 1000),
        );
      }
    });

    test('to and from json', () {
      expect(Speed.fromJson({'type': 'Speed', 'si': 1}), Speed(mps: 1));
      expect(Speed(mps: 2).toJson(), {'type': 'Speed', 'si': 2});
      expect(Speed.fromJson(Speed(mps: 1).toJson()), Speed(mps: 1));
    });
  });
}
