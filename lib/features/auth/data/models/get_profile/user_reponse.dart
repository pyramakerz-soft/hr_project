import 'package:flutter/foundation.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/location.dart';

class User {
  final int? id;
  final String? name;
  final String? nationalId;
  final String? image;
  final String? jobTitle;
  final String? roleName;
  final String? totalHours;
  final bool? isClockedOut;
  final String? clockIn;
  final bool? isWorkFromHome;
  final List<Location> locations;

  User({
    this.id,
    this.name,
    this.nationalId,
    this.image,
    this.jobTitle,
    this.roleName,
    this.isClockedOut,
    this.clockIn,
    this.isWorkFromHome,
    this.totalHours,
    this.locations = const [],
  });

  // Factory method to create a User from JSON
  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
      image: json['image'] as String?,
      jobTitle: json['job_title'] as String?,
      roleName: json['role_name'] as String?,
      isClockedOut: json['is_clocked_out'] == true ? true : false,
      clockIn: json['clockIn'] as String?,
      isWorkFromHome: json['work_home'] == true ? true : false,
      totalHours: json['total_hours'] as String?,
      locations: json['assignedLocationsUser'] != null
          ? List<Location>.from((json['assignedLocationsUser'] as List)
              .map((x) => Location.fromMap(x))).toList()
          : [],
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
      'work_home': isWorkFromHome,
      'total_hours': totalHours,
      'assignedLocationsUser': locations.map((x) => x.toMap()).toList(),
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? nationalId,
    String? image,
    String? jobTitle,
    String? roleName,
    bool? isClockedOut,
    String? clockIn,
    bool? isWorkFromHome,
    String? totalHours,
    List<Location>? locations,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      nationalId: nationalId ?? this.nationalId,
      image: image ?? this.image,
      jobTitle: jobTitle ?? this.jobTitle,
      roleName: roleName ?? this.roleName,
      isClockedOut: isClockedOut ?? this.isClockedOut,
      clockIn: clockIn ?? this.clockIn,
      isWorkFromHome: isWorkFromHome ?? this.isWorkFromHome,
      totalHours: totalHours ?? this.totalHours,
      locations: locations ?? this.locations,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, nationalId: $nationalId, image: $image, jobTitle: $jobTitle, roleName: $roleName, isClockedOut: $isClockedOut, clockIn: $clockIn, isWorkFromHome: $isWorkFromHome)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.nationalId == nationalId &&
        other.image == image &&
        other.jobTitle == jobTitle &&
        other.roleName == roleName &&
        other.isClockedOut == isClockedOut &&
        other.clockIn == clockIn &&
        other.totalHours == totalHours &&
        other.isWorkFromHome == isWorkFromHome &&
        listEquals(other.locations, locations);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nationalId.hashCode ^
        image.hashCode ^
        jobTitle.hashCode ^
        roleName.hashCode ^
        isClockedOut.hashCode ^
        totalHours.hashCode ^
        clockIn.hashCode ^
        isWorkFromHome.hashCode ^
        locations.hashCode;
  }
}
