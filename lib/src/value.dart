part of aviation_units;

abstract class Value<T extends Value<T>> implements Comparable<T> {
  /// Basic constructor
  const Value(this.si);

  final double si;

  /// Method must be overridden by implementing children.
  /// Override is only enforced when 'part of aviation_units' is used.
  T _constructBySi(double si);

  T operator +(final T other) => _constructBySi(si + other.si);
  T operator -(final T other) => _constructBySi(si - other.si);
  T operator *(final double factor) => _constructBySi(si * factor);
  T operator /(final double divisor) => _constructBySi(si / divisor);
  T operator -() => _constructBySi(-si);

  T operator %(final double other) => _constructBySi(si % other);

  @override
  bool operator ==(final dynamic other) => other is T && si == other.si;
  bool operator >(final T other) => si > other.si;
  bool operator >=(final T other) => si >= other.si;
  bool operator <(final T other) => si < other.si;
  bool operator <=(final T other) => si <= other.si;

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
