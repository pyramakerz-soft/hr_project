import 'package:flutter/foundation.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/location.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? name;
  final String? nationalId;
  final String? image;
  final String? jobTitle;
  final String? roleName;
  final String? totalHours;
  final DateTime? startTime;
  final DateTime? endTime;
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
    this.startTime,
    this.endTime,
    this.locations = const [],
  });

  DateTime? _parseTimeString(String? timeString) {
    if (timeString == null) return null;

    // Parsing the time string from HH:mm:ss format
    final timeFormat = DateFormat("HH:mm:ss");
    DateTime parsedTime = timeFormat.parse(timeString);

    // Combine with today's date to form a complete DateTime object
    DateTime now = DateTime.now();
    DateTime completeDateTime = DateTime(now.year, now.month, now.day,
        parsedTime.hour, parsedTime.minute, parsedTime.second);

    return completeDateTime;
  }

  DateTime? _convertUTCToEgyptLocalTime(String? utcTimeStr) {
    if (utcTimeStr == null) return null;

    try {
      final DateTime utcDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').parseUtc(utcTimeStr);
      final tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(utcDateTime, tz.getLocation('Africa/Cairo'));
      return egyptDateTime;
    } catch (e) {
      return null;
    }
  }

  String _convertTimeToEgyptLocalTime(String? timeStr) {
    if (timeStr == null) return '-';
    try {
      final DateTime utcDateTime = DateFormat('HH:mm:ss').parseUtc(timeStr);
      tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(utcDateTime, tz.getLocation('Africa/Cairo'));
      if (egyptDateTime.timeZoneOffset.inHours == 2) {
        egyptDateTime = egyptDateTime.add(const Duration(hours: 1));
      }
      final DateFormat outputFormat = DateFormat('hh:mm a');
      return outputFormat.format(egyptDateTime);
    } catch (e) {
      return 'Invalid Time Format';
    }
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
      image: json['image'] as String?,
      jobTitle: json['job_title'] as String?,
      roleName: json['role_name'] as String?,
      isClockedOut: json['is_clocked_out'] == true ? true : false,
      clockIn: json['clockIn'] != null
          ? User()._convertTimeToEgyptLocalTime(json['clockIn'] as String?)
          : null,
      isWorkFromHome: json['work_home'] == true ? true : false,
      totalHours: json['total_hours'] as String?,
      startTime: json['user_start_time'] != null
          ? User()._parseTimeString(json['user_start_time'] as String?)
          : null,
      endTime: json['user_end_time'] != null
          ? User()._parseTimeString(json['user_end_time'] as String?)
          : null,
      locations: json['assigned_locations_user'] != null
          ? List<Location>.from((json['assigned_locations_user'] as List)
              .map((x) => Location.fromMap(x))).toList()
          : [],
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    final timeFormat = DateFormat("HH:mm:ss");

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
      'user_start_time': endTime != null ? timeFormat.format(startTime!) : null,
      'user_end_time': endTime != null ? timeFormat.format(endTime!) : null,
      'assigned_locations_user': locations.map((x) => x.toMap()).toList(),
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
