import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:task/services/app/setting_service.dart';

Future<void> initServicesApp() async {
  await GetStorage.init("settings");
  await Get.putAsync(
    () => SettingService().init(),
  );
}
