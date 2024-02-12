import 'package:flutter/foundation.dart' show immutable;
import 'package:task/core/constants/strings.dart';

import 'package:task/helpers/entities/param/query_paramaters.dart';

@immutable
class DistanceParam implements QueryParameters {
  final double startLat;
  final double startLong;
  final double endLat;
  final double endLong;

  const DistanceParam({
    required this.startLat,
    required this.startLong,
    required this.endLat,
    required this.endLong,
  });

  @override
  Map<String, String> getQueryParameters() {
    Map<String, String> map = {
      "origin": "$startLat,$startLong",
      "destination": "$endLat,$endLong",
      "key": apiKey,
    };

    return map;
  }
}
