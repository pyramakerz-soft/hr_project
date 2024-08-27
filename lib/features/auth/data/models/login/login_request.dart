class LoginRequest {
  final String email;
  final String password;
  final String? serialNumber;
  LoginRequest({
    required this.email,
    required this.password,
     this.serialNumber,
  });

  // Method to convert `LoginRequest` instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'serial_number':serialNumber,
      'email': email,
      'password': password,
    };
  }

  LoginRequest copyWith({
    String? email,
    String? password,
    String? serialNumber,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      serialNumber: serialNumber ?? this.serialNumber,
    );
  }
}
