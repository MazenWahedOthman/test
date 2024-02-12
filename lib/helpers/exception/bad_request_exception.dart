import 'package:flutter/foundation.dart' show immutable;

import 'package:task/helpers/exception/app_exception.dart';

@immutable
class BadRequestException extends AppException {
  const BadRequestException({
    required super.url,
    super.message = "Bad Request Exception",
    super.data,
  });
}
