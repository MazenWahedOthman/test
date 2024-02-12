import 'package:dio/dio.dart';

import 'package:task/model/trip/distance.dart';
import 'package:task/core/constants/strings.dart';
import 'package:task/helpers/entities/param/query_paramaters.dart';
import 'package:task/helpers/error/error_handle.dart';
import 'package:task/services/api/trip/trip_service.dart';

class TripTaskService extends TripService {
  @override
  Future<Distance?> getDistance({required QueryParameters param}) async {
    const String tagUrl = "directions/json";
    final String url = baseUrl + tagUrl;

    try {
      final Response response = await dio.get(
        tagUrl,
        queryParameters: param.getQueryParameters(),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyRes = response.data;

        return Distance.fromMap(bodyRes);
      }
    } catch (error) {
      throw ErrorHandle.getException(error: error, url: url);
    }
    return null;
  }
}
