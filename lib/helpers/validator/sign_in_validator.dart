import 'package:task/core/constants/strings.dart';
import 'package:task/util/extension/is_email_not_valid_extension.dart';

mixin class SignInValidator {
  String? emailValidator(String? email) {
    if (email != null && email.isEmpty) {
      return emailNullError;
    }

    if (email != null && email.isEmailNotVaild) {
      return invalidEmailError;
    }

    return null;
  }

  String? passwordValidator(String? password) {
    if (password != null && password.isEmpty) {
      return passNullError;
    }

    if (password != null && password.length < 8) {
      return shortPassError;
    }

    return null;
  }
}
