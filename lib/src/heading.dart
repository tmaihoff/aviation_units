part of aviation_units;

class Heading extends Angle {
  const Heading({super.rad = 0, super.deg = 0});
  factory Heading.fromSi(double angle) => Heading(rad: angle);

  factory Heading.randomInt() =>
      Heading(deg: (Random().nextDouble() * 360).roundToDouble());

  static const Heading zero = Heading();

  /// The angle in degrees limited to the range of 0 to 360°.
  @override
  double get deg => rad * Angle.rad2deg;

  /// The angle in radians limited to the range of 0 to 2*pi.
  @override
  double get rad => (super.rad + 2 * pi) % (2 * pi);

  Heading get opposite => Heading(rad: rad + pi);

  @override
  Heading plus({double rad = 0, double deg = 0}) =>
      Heading(rad: this.rad + rad, deg: deg);

  @override
  Heading minus({double rad = 0, double deg = 0}) =>
      Heading(rad: this.rad - rad, deg: -deg);

  @override
  Angle operator -(Angle other) => diff(rad, other.rad);

  /// Calculates the Angle difference between the given headings which are given in rad.
  /// first minus second
  /// Source: https://stackoverflow.com/a/2007279/8539278
  static Angle diff(double first, double second) {
    return Angle(rad: atan2(sin(first - second), cos(first - second)));
  }

  @override

  /// The rounded angle in degrees in three digit format (e.g. 042).
  String degTo3DigitsString() {
    final NumberFormat formatter = NumberFormat('000');
    if (deg.round() == 0 || deg.round() == 360) {
      return formatter.format(360);
    }
    return formatter.format(deg.round());
  }

  @override
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': '$Heading', 'si': si};

  factory Heading.fromJson(Map<String, dynamic> json) =>
      Heading.fromSi(Value._parseJson<Heading>(json));
}
