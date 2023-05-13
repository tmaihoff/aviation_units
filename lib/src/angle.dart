part of '../aviation_units.dart';

class Angle extends Value<Angle> {
  static const double deg2rad = pi / 180;
  static const double rad2deg = 1 / deg2rad;

  @override
  Angle _constructBySi(double si) {
    return Angle.fromSi(si);
  }

  /// Angle with value 0.
  static const Angle zero = Angle();

  /// Angle with value 90 degrees.
  static const Angle deg45 = Angle(deg: 45);

  /// Angle with value 90 degrees.
  static const Angle deg90 = Angle(deg: 90);

  /// Angle with value 180 degrees.
  static const Angle deg180 = Angle(deg: 180);

  const Angle({double deg = 0, double rad = 0})
      : super(
          rad + //
              deg * deg2rad,
        );

  /// Constructs an angle based on si value. Si unit is radians.
  factory Angle.fromSi(double angle) => Angle(rad: angle);

  /// Calculates the Angle difference between the given angles.
  /// first minus second
  /// Source: https://stackoverflow.com/a/2007279/8539278
  factory Angle.diff(Angle first, Angle second) {
    return Angle(
      rad: atan2(
        sin(first.rad - second.rad),
        cos(first.rad - second.rad),
      ),
    );
  }

  Angle plus({double rad = 0, double deg = 0}) =>
      this + Angle(rad: rad, deg: deg);

  Angle minus({double rad = 0, double deg = 0}) =>
      this - Angle(rad: rad, deg: deg);

  /// This angle in radians.
  double get rad => si;

  /// This angle in degrees with the value range limited from 0 to 360°.
  double get deg => si * rad2deg;

  /// Limits the angle to an interval of 0° to 360°
  Angle get from0To360 {
    return Angle(rad: (si + 2 * pi) % (2 * pi));
  }

  /// Limits the angle to an interval of -180° to 180°
  // +pi and -pi to keep it in the range of -180 to 180
  Angle get fromM180To180 => Angle(rad: (si + pi + 2 * pi) % (2 * pi) - pi);

  @override
  String toString() {
    return '${deg.toStringAsFixed(2)} °';
  }

  String toStringWithDecimals(int decimals) {
    return '${deg.toStringAsFixed(decimals)} °';
  }

  /// The angle in degrees rounded to Integer.
  int asDegRoundedInt() {
    return deg.round();
  }

  /// The rounded angle in degrees in three digit format (e.g. 042).
  String degTo3DigitsString() {
    final NumberFormat formatter = NumberFormat('000');
    return formatter.format(deg.round());
  }

  factory Angle.fromJson(Map<String, dynamic> json) =>
      Angle.fromSi(Value._parseJson<Angle>(json));
}
