import 'package:flutter/foundation.dart' show immutable;

import 'package:task/helpers/entities/body/body.dart';

@immutable
class SignInBody extends Body {
  final String email;
  final String password;

  const SignInBody({
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> getBody() {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    return body;
  }
}
