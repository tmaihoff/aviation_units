// ignore_for_file: prefer_const_constructors

import 'package:aviation_units/aviation_units.dart';
import 'package:test/test.dart';

void main() {
  group('LatLng test:', () {
    test('zero', () {
      expect(LatLng.zero, LatLng(0, 0));
    });

    test('distance to haversine', () {
      // https: //www.movable-type.co.uk/scripts/latlong.html
      expect(LatLng(1, 1).distanceTo(LatLng(2, 2)).km, closeTo(157.2, 0.21));
    });

    // test('distance to', () {
    //   // reference: http://edwilliams.org/gccalc.htm
    //   expect(LatLng(-10, -20).distanceTo(LatLng(42, 21)).nm,
    //       closeTo(3842.335, 1e-3));
    //   expect(LatLng(0, 2).distanceTo(LatLng(2, 0)).nm,
    //       closeTo(169.42532905466763, 1e-3));
    // });

    test('bearing to', () {
      expect(LatLng(0, 0).bearingTo(LatLng(2, 0)).deg, closeTo(0, 1e-7));
      expect(LatLng(0, 0).bearingTo(LatLng(0, 2)).deg, closeTo(90, 1e-7));
      expect(LatLng(0, 0).bearingTo(LatLng(-2, 0)).deg, closeTo(180, 1e-7));
      expect(LatLng(0, 0).bearingTo(LatLng(0, -2)).deg, closeTo(270, 1e-7));

      // reference: https://www.movable-type.co.uk/scripts/latlong.html
      expect(LatLng(-1, -2).bearingTo(LatLng(3, 4)).deg,
          closeTo(56.283, 1e-3)); // initial bearing
    });

    test('offset', () {
      final offset =
          LatLng(1, 2).offset(const Heading(deg: 45), const Length(km: 100));
      expect(offset.latitude, closeTo(1.635833, 1e-2));
      expect(offset.longitude, closeTo(2.636111, 1e-3));
    });

    test('to and from json', () {
      final json = LatLng(1, 2).toJson();
      final latLng = LatLng.fromJson(json);
      expect(latLng.latitude, equals(1));
      expect(latLng.longitude, equals(2));
    });
  });
}
