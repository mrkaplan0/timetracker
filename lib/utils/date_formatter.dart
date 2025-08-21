import 'package:intl/intl.dart';

/// DateFormatter class - Manages date and time formatting operations
class DateFormatter {
  // Private constructor to prevent instantiation
  DateFormatter._();

  // Common date formats
  static const String _defaultDateFormat = 'dd/MM/yyyy';
  static const String _defaultTimeFormat = 'HH:mm';
  static const String _defaultDateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String _fullDateFormat = 'dd MMMM yyyy, EEEE';
  static const String _shortDateFormat = 'dd.MM.yy';
  static const String _isoDateFormat = 'yyyy-MM-dd';
  static const String _isoDateTimeFormat = 'yyyy-MM-ddTHH:mm:ss';

  /// Converts DateTime to string in default date format (dd/MM/yyyy)
  static String formatDate(DateTime date) {
    return DateFormat(_defaultDateFormat).format(date);
  }

  /// Converts DateTime to string in default time format (HH:mm)
  static String formatTime(DateTime time) {
    return DateFormat(_defaultTimeFormat).format(time);
  }

  /// Converts DateTime to string in default datetime format (dd/MM/yyyy HH:mm)
  static String formatDateTime(DateTime dateTime) {
    return DateFormat(_defaultDateTimeFormat).format(dateTime);
  }

  /// Converts DateTime to string in full date format (dd MMMM yyyy, EEEE)
  static String formatFullDate(DateTime date) {
    return DateFormat(_fullDateFormat, 'tr_TR').format(date);
  }

  /// Converts DateTime to string in short date format (dd.MM.yy)
  static String formatShortDate(DateTime date) {
    return DateFormat(_shortDateFormat).format(date);
  }

  /// Converts DateTime to string in ISO format (yyyy-MM-dd)
  static String formatIsoDate(DateTime date) {
    return DateFormat(_isoDateFormat).format(date);
  }

  /// Converts DateTime to string in ISO datetime format (yyyy-MM-ddTHH:mm:ss)
  static String formatIsoDateTime(DateTime dateTime) {
    return DateFormat(_isoDateTimeFormat).format(dateTime);
  }

  /// Converts DateTime to string with custom format
  static String formatCustom(DateTime dateTime, String pattern) {
    return DateFormat(pattern).format(dateTime);
  }

  /// Converts string to DateTime (default format: dd/MM/yyyy)
  static DateTime? parseDate(String dateString) {
    try {
      return DateFormat(_defaultDateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Converts string to DateTime (default format: HH:mm)
  static DateTime? parseTime(String timeString) {
    try {
      final now = DateTime.now();
      final time = DateFormat(_defaultTimeFormat).parse(timeString);
      return DateTime(now.year, now.month, now.day, time.hour, time.minute);
    } catch (e) {
      return null;
    }
  }

  /// Converts string to DateTime (default format: dd/MM/yyyy HH:mm)
  static DateTime? parseDateTime(String dateTimeString) {
    try {
      return DateFormat(_defaultDateTimeFormat).parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }

  /// Converts ISO format string to DateTime
  static DateTime? parseIsoDate(String isoDateString) {
    try {
      return DateFormat(_isoDateFormat).parse(isoDateString);
    } catch (e) {
      return null;
    }
  }

  /// Converts ISO datetime format string to DateTime
  static DateTime? parseIsoDateTime(String isoDateTimeString) {
    try {
      return DateFormat(_isoDateTimeFormat).parse(isoDateTimeString);
    } catch (e) {
      return null;
    }
  }

  /// Converts string to DateTime with custom format
  static DateTime? parseCustom(String dateString, String pattern) {
    try {
      return DateFormat(pattern).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Calculates the difference between two dates
  static String getDifferenceString(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);

    if (difference.inDays > 0) {
      return '${difference.inDays} Tage';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Stunden';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Minuten';
    } else {
      return '${difference.inSeconds} Sekunden';
    }
  }

  /// Checks if the date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Checks if the date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Checks if the date is in this week
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        date.isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  /// Returns relative date string (Today, Yesterday, etc.)
  static String getRelativeDateString(DateTime date) {
    if (isToday(date)) {
      return 'Heute';
    } else if (isYesterday(date)) {
      return 'Gestern';
    } else if (isThisWeek(date)) {
      return DateFormat('EEEE', 'de_DE').format(date);
    } else {
      return formatDate(date);
    }
  }

  /// Returns duration in hour:minute format
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  /// Returns duration as detailed string
  static String formatDurationDetailed(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    List<String> parts = [];
    if (hours > 0) parts.add('$hours Stunden');
    if (minutes > 0) parts.add('$minutes Minuten');
    if (seconds > 0 && hours == 0) parts.add('$seconds Sekunden');

    return parts.isEmpty ? '0 Sekunde' : parts.join(' ');
  }
}
