class TypeFormatter {
  static int parseToInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.parse(value);
    if (value is num) return value.toInt();
    throw ArgumentError('Cannot parse user_id from $value');
  }

  static double parseToDouble(dynamic value) {
    if (value is double) return value;
    if (value is String) return double.parse(value);
    if (value is num) return value.toDouble();
    throw ArgumentError('Cannot parse total_hours from $value');
  }
}
