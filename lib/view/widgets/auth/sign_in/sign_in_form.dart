import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:task/controller/auth/sign_in_controller.dart';
import 'package:task/view/widgets/auth/sign_in/input_outline.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInController.formState,
      child: Column(
        children: [
          InputOutline(
            title: "Email",
            hintText: "Please Enter an Email",
            controller: signInController.emailController,
            validator: signInController.emailValidator,
          ),
          SizedBox(
            height: 10.h,
          ),
          Obx(
            () => InputOutline(
              title: "Password",
              hintText: "Please Enter a Password",
              obscureText: signInController.isObscureText.value,
              controller: signInController.passwordController,
              validator: signInController.passwordValidator,
              suffixIcon: IconButton(
                onPressed: signInController.onPressObscureText,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    signInController.isObscureText.value
                        ? FluentIcons.eye_20_regular
                        : FluentIcons.eye_off_20_regular,
                    color: Colors.black.withOpacity(0.65),
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
