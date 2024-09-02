class ApiConstants {
  static const String baseUrl =
      "https://pyramakerz-artifacts.com/hr/public/api";
  static const String login = '$baseUrl/auth/login';
  static const String userByToken = '$baseUrl/auth/user_by_token';
  static const String clockIn = '$baseUrl/clock_in';
  static const String clockOut = '$baseUrl/clock_out';
  static const String getMyClocks = '$baseUrl/user_clocks';
}
