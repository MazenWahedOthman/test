import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/controller/auth/sign_in_controller.dart';
import 'package:task/view/common/app/my_elevated_button.dart';

class SignInSubmit extends StatelessWidget {
  SignInSubmit({super.key});

  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      title: "Sign In",
      onPress: signInController.onPressSignIn,
    );
  }
}
