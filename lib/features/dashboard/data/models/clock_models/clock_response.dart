// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClockResponse {
  final String result;
  final String message;
  final Clock clock;

  ClockResponse({
    required this.result,
    required this.message,
    required this.clock,
  });

  // Convert ClockResponse object to a Map (useful for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'result': result,
      'message': message,
      'clock': clock.toMap(),
    };
  }

  // Create a ClockResponse object from a Map (useful for JSON deserialization)
  factory ClockResponse.fromMap(Map<String, dynamic> map) {
    return ClockResponse(
      result: map['result'],
      message: map['message'],
      clock: Clock.fromMap(map['clock']),
    );
  }
}

class Clock {
  final DateTime? clockIn;
  final DateTime? clockOut;
  final int? duration;
  final int? userId;
  final int? locationId;
  final String? locationType;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Clock({
    required this.clockIn,
    this.clockOut,
    this.duration,
    this.userId,
    this.locationId,
    this.locationType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Clock copyWith({
    DateTime? clockIn,
    DateTime? clockOut,
    int? duration,
    int? userId,
    int? locationId,
    String? locationType,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) {
    return Clock(
      clockIn: clockIn ?? this.clockIn,
      clockOut: clockOut ?? this.clockOut,
      duration: duration ?? this.duration,
      userId: userId ?? this.userId,
      locationId: locationId ?? this.locationId,
      locationType: locationType ?? this.locationType,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clock_in': clockIn?.millisecondsSinceEpoch,
      'clock_out': clockOut?.millisecondsSinceEpoch,
      'duration': duration,
      'user_id': userId,
      'location_id': locationId,
      'location_type': locationType,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'id': id,
    };
  }

  factory Clock.fromMap(Map<String, dynamic> map) {
    return Clock(
      clockIn: map['clock_in'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['clock_in'] as int)
          : null,
      clockOut: map['clock_out'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['clock_out'] as int)
          : null,
      duration: map['duration'] != null ? map['duration'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      locationId: map['location_id'] != null ? map['location_id'] as int : null,
      locationType:
          map['location_type'] != null ? map['location_type'] as String : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int)
          : null,
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int)
          : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clock.fromJson(String source) =>
      Clock.fromMap(json.decode(source) as Map<String, dynamic>);
}
