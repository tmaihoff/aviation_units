import 'package:aviation_units/aviation_units.dart';

Angle lerpAngle(Angle a, Angle b, double t) => Angle(
      rad: lerpDouble(
        a.rad,
        b.rad,
        t,
      ),
    );

Bank lerpBank(Bank a, Bank b, double t) {
  final diff = b - a; // lerp the shortest direction
  return Bank(
    rad: lerpDouble(
      a.rad,
      a.rad + diff.rad,
      t,
    ),
  );
}

Heading lerpHeading(Heading a, Heading b, double t) {
  final diff = b - a; // lerp the shortest direction
  return Heading(
    rad: lerpDouble(
      a.rad,
      a.rad + diff.rad,
      t,
    ),
  );
}

LatLng lerpLatLng(LatLng a, LatLng b, double t) => LatLng(
      lerpDouble(
        a.latitude,
        b.latitude,
        t,
      ),
      lerpDouble(
        a.longitude,
        b.longitude,
        t,
      ),
    );

Length lerpLength(Length a, Length b, double t) => Length(
      m: lerpDouble(
        a.m,
        b.m,
        t,
      ),
    );

Pitch lerpPitch(Pitch a, Pitch b, double t) => Pitch(
      rad: lerpDouble(
        a.rad,
        b.rad,
        t,
      ),
    );

Speed lerpSpeed(Speed a, Speed b, double t) => Speed(
      mps: lerpDouble(
        a.mps,
        b.mps,
        t,
      ),
    );

/// Copied from dart:ui package
/// Linearly interpolate between two numbers, `a` and `b`, by an extrapolation
/// factor `t`.
///
/// When `a` and `b` are equal or both NaN, `a` is returned.  Otherwise,
/// `a`, `b`, and `t` are required to be finite or null, and the result of `a +
/// (b - a) * t` is returned, where nulls are defaulted to 0.0.
double lerpDouble(num a, num b, double t) {
  if (a == b || (a.isNaN == true) && (b.isNaN == true)) {
    return a.toDouble();
  }
  // a ??= 0.0;
  // b ??= 0.0;
  assert(a.isFinite, 'Cannot interpolate between finite and non-finite values');
  assert(b.isFinite, 'Cannot interpolate between finite and non-finite values');
  assert(t.isFinite, 't must be finite when interpolating between values');
  return a * (1.0 - t) + b * t;
}
