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
  final DateTime clockIn;
  final DateTime? clockOut;
  final int? duration;
  final int userId;
  final int? locationId;
  final String locationType;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Clock({
    required this.clockIn,
    this.clockOut,
    this.duration,
    required this.userId,
    this.locationId,
    required this.locationType,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Convert Clock object to a Map (useful for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'clock_in': clockIn.toUtc().toIso8601String(),
      'clock_out': clockOut?.toUtc().toIso8601String(),
      'duration': duration,
      'user_id': userId,
      'location_id': locationId,
      'location_type': locationType,
      'updated_at': updatedAt.toUtc().toIso8601String(),
      'created_at': createdAt.toUtc().toIso8601String(),
      'id': id,
    };
  }

  // Create a Clock object from a Map (useful for JSON deserialization)
  factory Clock.fromMap(Map<String, dynamic> map) {
    return Clock(
      clockIn: DateTime.parse(map['clock_in']).toUtc(),
      clockOut: map['clock_out'] != null ? DateTime.parse(map['clock_out']).toUtc() : null,
      duration: map['duration'],
      userId: map['user_id'],
      locationId: map['location_id'],
      locationType: map['location_type'],
      updatedAt: DateTime.parse(map['updated_at']).toUtc(),
      createdAt: DateTime.parse(map['created_at']).toUtc(),
      id: map['id'],
    );
  }
}
