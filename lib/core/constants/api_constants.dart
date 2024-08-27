class ApiConstants {
  // static const String baseUrl = "http://13.48.213.220";

  // static const String baseUrl = "https://personaltrainerkmm.com";
  // static const String baseUrl = "https://10.0.2.2:8000";

  static const String baseUrl = "http://127.0.0.1:8000";

  static const String api = "api";


    static const String base = "127.0.0.1:8000";

  static const baseURL = 'http://$base/api';

  static const String authBase = '$baseURL/auth';

  static const String login = '$authBase/login';
  static const String userbytoken = '$authBase/user_by_token';


  static const String clockin = '$baseURL/clock_in';
  static const String clockout = '$baseURL/clock_out';

}
