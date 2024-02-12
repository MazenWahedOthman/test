import 'package:get_it/get_it.dart';

import 'package:task/services/api/auth/auth_task_service.dart';
import 'package:task/services/api/trip/trip_task_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocatorApp() async {
  locator.registerLazySingleton(() => AuthTaskService());

  locator.registerLazySingleton(() => TripTaskService());
}
