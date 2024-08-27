
class ClockResponse {
  final bool result;
  final String message;
  final Clock? clock;

  ClockResponse({
    required this.result,
    required this.message,
    this.clock,
  });

  // Factory method to create a ClockResponse from JSON
  factory ClockResponse.fromJson(Map<String, dynamic> json) {
    return ClockResponse(
      result: json['result'] == 'true',
      message: json['message'] as String,
      clock: json['clock'] != null ? Clock.fromJson(json['clock']) : null,
    );
  }

  // Method to convert ClockResponse instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'result': result.toString(),
      'message': message,
      'clock': clock?.toJson(),
    };
  }
}

class Clock {
  final String clockIn;
  final String? clockOut;
  final String? duration;
  final int userId;
  final int locationId;
  final String updatedAt;
  final String createdAt;
  final int id;

  Clock({
    required this.clockIn,
    this.clockOut,
    this.duration,
    required this.userId,
    required this.locationId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Factory method to create a Clock from JSON
  factory Clock.fromJson(Map<String, dynamic> json) {
    return Clock(
      clockIn: json['clock_in'] as String,
      clockOut: json['clock_out'] as String?,
      duration: json['duration'] as String?,
      userId: json['user_id'] as int,
      locationId: json['location_id'] as int,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as int,
    );
  }

  // Method to convert Clock instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'clock_in': clockIn,
      'clock_out': clockOut,
      'duration': duration,
      'user_id': userId,
      'location_id': locationId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
