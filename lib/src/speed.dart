part of aviation_units;

class Speed extends Value<Speed> {
  // Source per unit conversion
  // https://www.nist.gov/pml/special-publication-811/nist-guide-si-appendix-b-conversion-factors/nist-guide-si-appendix-b9

  /// Knots -> meters per second
  static const double kt2mps = 5.1444444e-1;

  /// Meters per second -> knots
  static const double mps2kt = 1 / kt2mps;

  /// Kilometers per hour -> meters per second
  static const double kmh2mps = 2.777778e-1;

  /// Meters per second -> kilometers per hour
  static const double mps2kmh = 1 / kmh2mps;

  /// Feet per minute -> meters per second
  static const double ftpm2mps = 5.08e-3;

  /// Meters per second -> feet per minute
  static const double mps2ftpm = 1 / ftpm2mps;

  @override
  Speed _constructBySi(double si) {
    return Speed.fromSi(si);
  }

  const Speed({
    double mps = 0,
    double kmh = 0,
    double kt = 0,
    double ftpm = 0,
  }) : super(
          mps + //
              kmh * kmh2mps + //
              kt * kt2mps + //
              ftpm * ftpm2mps,
        );

  /// Speed with value 0.
  static const Speed zero = Speed();

  /// Constructs a speed based on si value. Si unit is meter per second.
  factory Speed.fromSi(double speed) => Speed(mps: speed);

  factory Speed.random({required Speed max}) =>
      Speed.fromSi(Random().nextDouble() * max.si);

  /// This speed in meters per second.
  double get mps => si;

  /// This speed in kilometers per hour.
  double get kmh => mps * mps2kmh;

  /// This speed in knots.
  double get kt => mps * mps2kt;

  /// This speed in feet per minute.
  double get ftpm => mps * mps2ftpm;

  @override
  String toString() {
    return '${mps.toStringAsFixed(1)} mps';
  }

  factory Speed.fromJson(Map<String, dynamic> json) =>
      Speed.fromSi(Value._parseJson<Speed>(json));
}
