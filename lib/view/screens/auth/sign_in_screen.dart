import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task/core/packages/screen_utils.dart';
import 'package:task/view/widgets/auth/sign_in/sign_in_form.dart';
import 'package:task/view/widgets/auth/sign_in/sign_in_submit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape = ScreenUtils.isLandscape;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 80.w : 20.w,
            ),
            child: Column(
              children: [
                SizedBox(height: isLandscape ? 100.h : 150.h),
                Text(
                  "Welcome Back".tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nto continue".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 60.h),
                SignInForm(),
                SizedBox(height: 20.h),
                SignInSubmit(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
