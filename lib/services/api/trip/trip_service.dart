import 'package:task/model/trip/distance.dart';
import 'package:task/helpers/entities/param/query_paramaters.dart';
import 'package:task/services/app/api_services.dart';

abstract class TripService extends ApiServices {
  Future<Distance?> getDistance({required QueryParameters param});
}
