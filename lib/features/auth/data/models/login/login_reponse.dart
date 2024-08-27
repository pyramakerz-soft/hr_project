class LoginResponse {
  final bool result;
  final String token;

  LoginResponse({required this.result, required this.token});

  // Factory constructor for creating a new `LoginResponse` instance from a map.
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      result: json['result'].toString().toLowerCase() == 'true',
      token: json['token'],
    );
  }

  // Method to convert `LoginResponse` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'result': result.toString(),
      'token': token,
    };
  }
}
