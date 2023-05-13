part of '../aviation_units.dart';

abstract class Value<T extends Value<T>> implements Comparable<T> {
  /// Basic constructor
  const Value(this.si);

  final double si;

  /// Method must be overridden by implementing children.
  /// Override is only enforced when 'part of aviation_units' is used.
  T _constructBySi(double si);

  T operator +(T other) => _constructBySi(si + other.si);
  T operator -(T other) => _constructBySi(si - other.si);
  T operator *(double factor) => _constructBySi(si * factor);
  T operator /(double divisor) => _constructBySi(si / divisor);
  T operator -() => _constructBySi(-si);

  T operator %(double other) => _constructBySi(si % other);

  @override
  bool operator ==(Object other) => other is T && si == other.si;
  bool operator >(T other) => si > other.si;
  bool operator >=(T other) => si >= other.si;
  bool operator <(T other) => si < other.si;
  bool operator <=(T other) => si <= other.si;

  T abs() => _constructBySi(si.abs());

  Map<String, dynamic> toJson() => <String, dynamic>{'type': '$T', 'si': si};

  static double _parseJson<D>(Map<String, dynamic> json) {
    if (json['type'] == D.toString()) {
      return (json['si'] as num?)?.toDouble() ?? 0;
    }
    return 0;
  }

  @override
  int compareTo(T other) {
    return si.compareTo(other.si);
  }

  @override
  int get hashCode => si.hashCode + T.hashCode;
}
