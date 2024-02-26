import 'package:flutter/foundation.dart' show immutable;

import 'package:task/helpers/entities/param/query_paramaters.dart';

@immutable
class NearlyPlacesParam implements QueryParameters {
  final double lat;
  final double lng;
  final String key;

  const NearlyPlacesParam({
    required this.lat,
    required this.lng,
    required this.key,
  });

  @override
  Map<String, String> getQueryParameters() {
    Map<String, String> map = {

      "location":"$lat,$lng",
      "radius":"1000",
      "key":key,
  
    };

    return map;
  }
}
