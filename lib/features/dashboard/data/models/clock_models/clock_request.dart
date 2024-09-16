// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class ClockRequest {
  final double? latitude;
  final double? longitude;
  final bool? isFromSite;
  final DateTime? clockIn;
  final DateTime? clockOut;
  final int? locationId;

  ClockRequest({
    this.latitude,
    this.longitude,
    this.isFromSite,
    this.clockIn,
    this.clockOut,
    this.locationId,
  });

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

  String _convertEgyptLocalTimeToUTCString(DateTime? localDateTime) {
    if (localDateTime == null) return 'Invalid DateTime';
    try {
      final tz.TZDateTime egyptDateTime =
          tz.TZDateTime.from(localDateTime, tz.getLocation('Africa/Cairo'));

      final DateTime utcDateTime = egyptDateTime.toUtc();

      final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return dateFormat.format(utcDateTime);
    } catch (e) {
      return 'Invalid DateTime Format';
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'location_type':
          isFromSite == true ? LocationType.site.name : LocationType.home.name,
      'clock_in': clockIn != null
          ? ClockRequest()._convertEgyptLocalTimeToUTCString(clockIn)
          : null,
      'clock_out': clockOut != null
          ? ClockRequest()._convertEgyptLocalTimeToUTCString(clockOut)
          : null,
      'location_id': locationId
    };
  }

  factory ClockRequest.fromMap(Map<String, dynamic> map) {
    return ClockRequest(
      latitude:
          map['latitude'] != null ? (map['latitude'] as num).toDouble() : null,
      longitude: map['longitude'] != null
          ? (map['longitude'] as num).toDouble()
          : null,
      isFromSite: map['location_type'] != null
          ? map['location_type'] == LocationType.site.name
          : false,
      clockIn: map['clock_in'] != null
          ? ClockRequest()
              ._convertUTCToEgyptLocalTime(map['clock_in'] as String)
          : null,
      clockOut: map['clock_out'] != null
          ? ClockRequest()
              ._convertUTCToEgyptLocalTime(map['clock_out'] as String)
          : null, // Fixed reference to clock_out
      locationId: map['location_id'] != null
          ? (map['location_id'] as num).toInt()
          : null,
    );
  }

  String toJson() => json.encode(toMap());
  factory ClockRequest.fromJson(String source) =>
      ClockRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum LocationType {
  site,
  home,
}

extension Getters on LocationType {
  String text() {
    switch (this) {
      case LocationType.site:
        return 'site';
      case LocationType.home:
        return 'home';
    }
  }
}
