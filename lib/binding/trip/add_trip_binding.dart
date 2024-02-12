import 'package:flutter/foundation.dart' show immutable;
import 'package:get/get.dart';

import 'package:task/controller/trip/add_trip_controller.dart';

@immutable
class AddTripBinding implements Bindings {
  const AddTripBinding();

  @override
  void dependencies() {
    Get.put(AddTripController());
  }
}
