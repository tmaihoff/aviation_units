part of aviation_units;

class Bank extends Angle {
  const Bank({super.rad = 0, super.deg = 0});

  factory Bank.fromSi(double angle) => Bank(rad: angle);

  static const Bank zero = Bank();

  /// The bank in degrees limited to the range of -180 to 180°.
  @override
  double get deg => rad * Angle.rad2deg;

  /// The bank in radians limited to the range of -pi to pi.
  @override
  double get rad => super.fromM180To180.rad;

  @override
  Angle operator -(Angle other) => Angle.diff(this, other);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{'type': '$Bank', 'si': si};

  factory Bank.fromJson(Map<String, dynamic> json) =>
      Bank.fromSi(Value._parseJson<Bank>(json));
}
