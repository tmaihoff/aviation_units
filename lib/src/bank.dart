part of aviation_units;

class Bank extends Angle {
  const Bank({double rad = 0, double deg = 0}) : super(rad: rad, deg: deg);

  factory Bank.fromSi(double angle) => Bank(rad: angle);

  static const Bank zero = Bank();

  /// The bank in degrees limited to the range of -180 to 180°.
  @override
  double get deg => rad * Angle.rad2deg;

  /// The bank in radians limited to the range of -pi to pi.
  @override
  double get rad => super.fromM180To180.rad;

  @override
  Angle operator -(final Angle other) => Angle.diff(this, other);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{'type': '$Bank', 'si': si};

  factory Bank.fromJson(Map<String, dynamic> json) =>
      Bank.fromSi(Value._parseJson<Bank>(json));
}

Bank lerpBank(Bank a, Bank b, double t) {
  final diff = b - a; // lerp the right direction
  return Bank(
    rad: lerpDouble(
      a.rad,
      a.rad + diff.rad,
      t,
    ),
  );
}
