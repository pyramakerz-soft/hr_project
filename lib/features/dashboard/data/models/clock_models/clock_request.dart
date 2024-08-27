import 'dart:convert';

class ClockRequest {

 final String latitude;
 final String longitude;
  ClockRequest({
   required this.latitude,
   required this.longitude,
  });


  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

 

  String toJson() => json.encode(toMap());

}
