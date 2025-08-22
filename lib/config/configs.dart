class Configs {
  static const String apiBaseUrl = 'http://192.168.2.39:8000';
  static const String loginUrl = '/api/login';
  static const String timeEntriesUrl = '/api/time-entries';
  static const String registerUrl = '/api/register';
  static const String logoutUrl = '/api/logout';
  static const String currentUserUrl = '/api/user';
  static const String userEntriesUrl = '/api/time-entries';
  static const String adminUrl = '/api/admin';
  static const String allReportsUrl = '/reports/time';
  static const String oneUserReportUrl = '/users/';
  static const int defaultTimeout = 30; // in seconds
  static const bool enableLogging = true;
}
