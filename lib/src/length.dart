part of aviation_units;

class Length extends Value<Length> {
  // Soruce: https://en.wikipedia.org/wiki/Conversion_of_units#Length
  static const double feet2meters = 0.3048;
  static const double meters2feet = 1 / feet2meters;
  static const double nauticalMiles2Meters = 1852;
  static const double meters2nauticalMiles = 1 / nauticalMiles2Meters;
  static const double kilometers2meters = 1000;
  static const double meters2kilometers = 1 / kilometers2meters;

  @override
  Length _constructBySi(double si) {
    return Length.fromSi(si);
  }

  const Length({
    double m = 0,
    double km = 0,
    double nm = 0,
    double ft = 0,
  }) : super(
          m + //
              km * kilometers2meters + //
              nm * nauticalMiles2Meters + //
              ft * feet2meters,
        );

  /// Length with value 0.
  static const Length zero = Length();

  /// Constructs a length based on si value. Si unit is meters.
  factory Length.fromSi(double si) => Length(m: si);

  /// This length in meters.
  double get m => si;

  /// This length in kilometers.
  double get km => m * meters2kilometers;

  /// This length in feet.
  double get ft => m * meters2feet;

  /// This length in nautical miles.
  double get nm => m * meters2nauticalMiles;

  @override
  String toString() {
    return '${m.toStringAsFixed(2)} m';
  }

  factory Length.fromJson(Map<String, dynamic> json) =>
      Length.fromSi(Value._parseJson<Length>(json));
}

Length lerpLength(Length a, Length b, double t) => Length(
      m: lerpDouble(
        a.m,
        b.m,
        t,
      ),
    );
