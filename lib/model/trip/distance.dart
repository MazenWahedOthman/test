// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart' show immutable;

@immutable
class Distance {
  String text;

  Distance({required this.text});

  factory Distance.fromMap(Map<String, dynamic> map) {
    String distance = "";
    final List routesList = map['routes'] ?? [];
    if (routesList.isNotEmpty) {
      final List legsList = (routesList.first)['legs'] ?? [];
      if (legsList.isNotEmpty) {
        distance = (legsList.first)['distance']?['text'] ?? "";
      }
    }
    return Distance(text: distance);
  }
}
