// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class ClockRequest {
  final double? latitude;
  final double? longitude;
  final bool? isFromSite;
  final DateTime? clockIn;
  final DateTime? clockOut;

  ClockRequest({
    this.latitude,
    this.longitude,
    this.isFromSite,
    this.clockIn,
    this.clockOut,
  });
  DateTime? _convertUTCToEgyptLocalTime(String? utcTimeStr) {
    if (utcTimeStr == null) return null;
    final DateTime utcDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parseUtc(utcTimeStr);
    final localDateStr = utcDateTime.toLocal().toString();
    final DateTime localDate = DateTime.parse(localDateStr);
    return localDate;
  }

  Map<String, dynamic> toMap() {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'location_type':
          isFromSite == true ? LocationType.site.name : LocationType.home.name,
      'clock_in': clockIn != null ? dateFormat.format(clockIn!.toUtc()) : null,
      'clock_out':
          clockOut != null ? dateFormat.format(clockOut!.toUtc()) : null,
    };
  }

  factory ClockRequest.fromMap(Map<String, dynamic> map) {
    return ClockRequest(
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      isFromSite: map['location_type'] != null
          ? map['location_type'] as String == LocationType.site.name
          : false,
      clockIn: map['clock_in'] != null
          ? ClockRequest()
              ._convertUTCToEgyptLocalTime(map['clock_in'] as String)
          : null,
      clockOut: map['clock_out'] != null
          ? ClockRequest()
              ._convertUTCToEgyptLocalTime(map['clock_in'] as String)
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
