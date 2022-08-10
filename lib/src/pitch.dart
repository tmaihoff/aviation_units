part of aviation_units;

class Pitch extends Angle {
  const Pitch({super.rad = 0, super.deg = 0});

  factory Pitch.fromSi(double angle) => Pitch(rad: angle);

  static const Pitch zero = Pitch();

  /// The angle in degrees limited to the range of -90 to 90°.
  @override
  double get deg => Angle(rad: rad).deg;

  /// The angle in rad limited to the range of -pi/2 to pi/2.
  @override
  double get rad {
    final sign = sin(super.rad).sign;

    // some geometry...
    return sign * atan2(sin(super.rad).abs(), cos(super.rad).abs());
  }

  @override
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': '$Pitch', 'si': si};

  factory Pitch.fromJson(Map<String, dynamic> json) =>
      Pitch.fromSi(Value._parseJson<Pitch>(json));
}
