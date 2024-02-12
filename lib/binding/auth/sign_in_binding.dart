import 'package:flutter/foundation.dart' show immutable;
import 'package:get/get.dart';

import 'package:task/controller/auth/sign_in_controller.dart';

@immutable
class SignInBinding implements Bindings {
  const SignInBinding();

  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
