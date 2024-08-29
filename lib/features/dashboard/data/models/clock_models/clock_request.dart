class ClockRequest {
  final double? latitude;
  final double? longitude;
  final String? locationType;
  final DateTime? clockIn;

  ClockRequest({
    this.latitude,
    this.longitude,
    this.locationType,
    this.clockIn,
  });

  // Convert Location object to a Map (useful for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'location_type': locationType,
      'clock_in': clockIn?.toUtc().toIso8601String(),
    };
  }

  // Create a Location object from a Map (useful for JSON deserialization)
  factory ClockRequest.fromMap(Map<String, dynamic> map) {
    return ClockRequest(
      latitude: map['latitude'],
      longitude: map['longitude'],
      locationType: map['location_type'],
      clockIn: DateTime.parse(map['clock_in']).toUtc(),
    );
  }
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
