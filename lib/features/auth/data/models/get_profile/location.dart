// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  final int? locationId;
  final String? locationName;
  Location({
    this.locationId,
    this.locationName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location_id': locationId,
      'location_name': locationName,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locationId: map['location_id'] != null ? map['location_id'] as int : null,
      locationName:
          map['location_name'] != null ? map['location_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);
}
