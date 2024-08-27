

class User {
  final int id;
  final String name;
  final String nationalId;
  final String image;
  final String jobTitle;
  final String roleName;
  final bool isClockedOut;
  final String clockIn;

  User({
    required this.id,
    required this.name,
    required this.nationalId,
    required this.image,
    required this.jobTitle,
    required this.roleName,
    required this.isClockedOut,
    required this.clockIn,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      nationalId: json['national_id'] as String,
      image: json['image'] as String,
      jobTitle: json['job_title'] as String,
      roleName: json['role_name'] as String,
      isClockedOut: json['is_clocked_out'] as bool,
      clockIn: json['clockIn'] as String,
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'national_id': nationalId,
      'image': image,
      'job_title': jobTitle,
      'role_name': roleName,
      'is_clocked_out': isClockedOut,
      'clockIn': clockIn,
    };
  }
}
