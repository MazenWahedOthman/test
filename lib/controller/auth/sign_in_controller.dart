import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:task/core/functions/app/setup_locator_app.dart';
import 'package:task/core/routers/screens.dart';
import 'package:task/helpers/entities/body/sign_in_body.dart';
import 'package:task/helpers/exception/app_exception.dart';
import 'package:task/helpers/ui/app_snackbar.dart';
import 'package:task/helpers/validator/sign_in_validator.dart';
import 'package:task/services/api/auth/auth_task_service.dart';
import 'package:task/services/app/setting_service.dart';
import 'package:task/util/app/keyboard_util.dart';

class SignInController extends GetxController with SignInValidator {
  final authService = locator.get<AuthTaskService>();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isObscureText = true.obs;

  void onPressObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  Future<void> onPressSignIn() async {
    bool isValidate = formState.currentState?.validate() ?? false;
    if (isValidate) {
      KeyboardUtil.hideKeyboard();
      Get.context!.loaderOverlay.show();
      await signIn();
      Get.context!.loaderOverlay.hide();
    }
  }

  Future<void> signIn() async {
    final bool? isAuth = await authService
        .signIn(
          body: SignInBody(
            email: emailController.text,
            password: passwordController.text,
          ),
        )
        .catchError(handleError);
    if (isAuth != null) {
      final SettingService settingService = Get.find();
      settingService.changeIsAuth(true);
      AppSnackBar.showSnackBar(
        message: "You have been logged in successfully".tr,
        icon: Icons.done_all_outlined,
      );
      Get.offNamed(Screens.addTrip);
    }
  }

  dynamic handleError(error) {
    if (error is AppException) {
      AppSnackBar.showSnackBar(message: error.message);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    isObscureText.close();
    super.onClose();
  }
}
