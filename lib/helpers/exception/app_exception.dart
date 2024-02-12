import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppException implements Exception {
  final String url;
  final String message;
  final dynamic data;
  const AppException({
    required this.url,
    required this.message,
    this.data,
  });

  const AppException.init()
      : url = "",
        message = "",
        data = null;
}
