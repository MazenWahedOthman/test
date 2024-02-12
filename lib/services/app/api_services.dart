import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import 'package:task/core/constants/durations.dart';
import 'package:task/core/constants/strings.dart';
import 'package:task/services/app/setting_service.dart';

abstract class ApiServices {
  final SettingService settingService = Get.find();

  late Dio dio;
  ApiServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    dio = Dio(baseOptions);
  }
}
