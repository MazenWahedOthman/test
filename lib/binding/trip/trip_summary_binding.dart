import 'package:flutter/foundation.dart' show immutable;
import 'package:get/get.dart';

import 'package:task/controller/trip/trip_summary_controller.dart';

@immutable
class TripSummaryBinding implements Bindings {
  const TripSummaryBinding();

  @override
  void dependencies() {
    Get.put(TripSummaryController());
  }
}
