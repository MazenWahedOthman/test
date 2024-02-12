import 'package:flutter/foundation.dart' show immutable;

import 'package:task/helpers/exception/app_exception.dart';

@immutable
class UnAuthorizedException extends AppException {
  const UnAuthorizedException({
    required super.url,
    super.message = "UnAuthorized Request",
    super.data,
  });
}
