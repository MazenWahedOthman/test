import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:task/helpers/exception/app_exception.dart';
import 'package:task/helpers/exception/bad_request_exception.dart';
import 'package:task/helpers/exception/unauthorized_exception.dart';

class ErrorHandle {
  static AppException getException({
    required dynamic error,
    String url = '',
    dynamic data,
  }) {
    if (error is DioException) {
      if (error.response != null && error.response!.statusCode == 400) {
        return BadRequestException(
          url: url,
          message: error.response?.data['message'],
          data: data,
        );
      }

      if (error.response != null && error.response!.statusCode == 401) {
        return UnAuthorizedException(
          url: url,
          message: error.response?.data['message'] ?? "",
          data: data,
        );
      }

      if (error.response != null && error.response!.statusCode == 500) {
        return AppException(
          url: url,
          message: "An error occurred from server",
          data: data,
        );
      }

      if (error.type == DioExceptionType.connectionTimeout) {
        return AppException(
          url: url,
          message: "Timed out for request".tr,
          data: data,
        );
      }

      if (error.message?.contains("SocketException") ?? false) {
        return AppException(
          url: url,
          message: "No internet connection".tr,
          data: data,
        );
      }

      return AppException(
        url: url,
        message: "Error connection occured".tr,
        data: data,
      );
    }

    if (error is TypeError) {
      return AppException(
        url: url,
        message: "Problem retrieving data, contact with admin".tr,
        data: data,
      );
    }

    if (error is PlatformException) {
      throw AppException(
        url: url,
        message: error.message ?? "",
      );
    }

    return AppException(
      url: url,
      message: "Error occurred".tr,
      data: data,
    );
  }
}
