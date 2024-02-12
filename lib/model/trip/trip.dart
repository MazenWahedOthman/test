import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/model/trip/distance.dart';

class Trip {
  final String duration;
  final String startTime;
  final String endTime;
  final LatLng orgin;
  final LatLng destination;
  final String startLocation;
  final String endLocation;
  Distance? distance;
  String? cost;

  Trip({
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.orgin,
    required this.destination,
    required this.startLocation,
    required this.endLocation,
    this.distance,
    this.cost,
  });
}
