class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  // Method to convert `LoginRequest` instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
