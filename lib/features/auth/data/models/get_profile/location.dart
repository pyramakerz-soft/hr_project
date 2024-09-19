// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class Location {
  final int? locationId;
  final String? locationName;
  final DateTime? locationStartTime;
  final DateTime? locationEndTime;
  Location({
    this.locationId,
    this.locationName,
    this.locationEndTime,
    this.locationStartTime,
  });
  DateTime? _parseTimeString(String timeStr) {
    try {
      // Parse the input time string (HH:mm:ss) as UTC
      final DateTime utcDateTime = DateFormat('HH:mm:ss').parseUtc(timeStr);

      // Convert UTC time to Cairo time
      tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(utcDateTime, tz.getLocation('Africa/Cairo'));

      // Return as DateTime object in HH:mm:ss format
      return DateTime(
        egyptDateTime.year,
        egyptDateTime.month,
        egyptDateTime.day,
        egyptDateTime.hour,
        egyptDateTime.minute,
        egyptDateTime.second,
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    final timeFormat = DateFormat("HH:mm:ss");
    return <String, dynamic>{
      'location_id': locationId,
      'location_name': locationName,
      'location_start_time': locationStartTime != null
          ? timeFormat.format(locationStartTime!)
          : null,
      'location_end_time':
          locationEndTime != null ? timeFormat.format(locationEndTime!) : null,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: map['location_id'] != null ? map['location_id'] as int : null,
      locationName:
          map['location_name'] != null ? map['location_name'] as String : null,
      locationStartTime: map['location_start_time'] != null
          ? Location()._parseTimeString(map['location_start_time'] as String)
          : null,
      locationEndTime: map['location_end_time'] != null
          ? Location()._parseTimeString(map['location_end_time'] as String)
          : null,
    );
  }
  String toJson() => json.encode(toMap());
  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);
}
