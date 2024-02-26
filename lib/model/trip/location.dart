
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Location{
  final double lat;
  final double lng;

   const Location({required this.lat,required this.lng});

      Location.fromMap(Map<String, dynamic> map) :
      lat=map['lat']??0.0,
      lng=map['lng']??0.0;

  

}