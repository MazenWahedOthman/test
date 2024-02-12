import 'package:get/get.dart';

import 'package:task/core/constants/doubles.dart';
import 'package:task/core/constants/status.dart';
import 'package:task/core/functions/app/setup_locator_app.dart';
import 'package:task/helpers/entities/param/distance_param.dart';
import 'package:task/helpers/exception/app_exception.dart';
import 'package:task/model/trip/distance.dart';
import 'package:task/model/trip/trip.dart';
import 'package:task/services/api/trip/trip_task_service.dart';

class TripSummaryController extends GetxController {
  final tripService = locator.get<TripTaskService>();

  late Trip trip;

  final RxString state = States.loading.obs;
  AppException exception = const AppException.init();

  @override
  void onInit() {
    final Map<String, dynamic> data = Get.arguments as Map<String, dynamic>;
    trip = data['trip'];

    getDistance();

    super.onInit();
  }

  Future<void> getDistance() async {
    final Distance? distance = await tripService
        .getDistance(
          param: DistanceParam(
            startLat: trip.orgin.latitude,
            startLong: trip.orgin.longitude,
            endLat: trip.destination.latitude,
            endLong: trip.destination.longitude,
          ),
        )
        .catchError(handleError);

    if (distance != null) {
      trip.distance = distance;
      final List<String> splits = distance.text.split(" ");
      if (splits.isNotEmpty) {
        final double cost = (double.tryParse(splits[0]) ?? 0.0) * costPerKm;
        trip.cost = "$cost AED";
      }
      state.value = States.data;
    }
  }

  dynamic handleError(error) {
    if (error is AppException) {
      state.value = States.error;
      exception = error;
    }
  }

  Future<void> onTryAgain() async {
    state.value = States.loading;
    await Future.delayed(const Duration(seconds: 2));
    getDistance();
  }

  @override
  void onClose() {
    state.close();
    super.onClose();
  }
}
