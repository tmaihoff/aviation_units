part of aviation_units;

class LatLng {
  final double latitude;
  final double longitude;

  const LatLng(
    this.latitude,
    this.longitude,
  );

  static const zero = LatLng(0.0, 0.0);

  Length distanceTo(LatLng other) {
    try {
      return Length(
        m: const pub.Distance(calculator: pub.Haversine()).as(
          pub.LengthUnit.Meter,
          pub.LatLng(latitude, longitude),
          pub.LatLng(other.latitude, other.longitude),
        ),
      );
    } catch (e) {
      // due to 'Bad state: Distance calculation faild to converge!' error.
      // which is thrown when not using Haversine(). Haversine() is less accurate though.
      // example airport which triggers this error: RPVV
      developer.log('error', name: 'LatLng.distanceTo', error: e);
      return Length.zero;
    }
  }

  Length dmeTo({
    required LatLng other,
    required Length thisHeight,
    required Length otherHeight,
  }) {
    final groundDistance = distanceTo(other);
    final hypotenuse = sqrt(
      pow(groundDistance.m, 2) + pow(thisHeight.m - otherHeight.m, 2),
    );
    return Length(m: hypotenuse.abs());
  }

  /// Initial bearing from this to other on a rhumb line.
  Heading bearingTo(LatLng other) {
    return Heading(
      deg: const pub.Distance().bearing(
        pub.LatLng(latitude, longitude),
        pub.LatLng(other.latitude, other.longitude),
      ),
    );
  }

  LatLng offset(Heading bearing, Length distance) {
    final newLatLng = const pub.Distance().offset(
      pub.LatLng(latitude, longitude),
      distance.m,
      bearing.deg,
    );

    return LatLng(newLatLng.latitude, newLatLng.longitude);
  }

  /// Returns the equivilant object from the latlong2 package
  pub.LatLng get latlong2 => pub.LatLng(latitude, longitude);

  @override
  String toString() => 'LatLng(latitude: $latitude, longitude: $longitude)';

  Map<String, dynamic> toJson() => pub.LatLng(latitude, longitude).toJson();

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        pub.LatLng.fromJson(json).latitude,
        pub.LatLng.fromJson(json).longitude,
      );

  //
  //* GENERATED BY DATA CLASS GENERATOR
  LatLng copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LatLng(
      latitude ?? this.latitude,
      longitude ?? this.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatLng &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
