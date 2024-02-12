import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/constants/strings.dart';

class ErrorLayout extends StatelessWidget {
  const ErrorLayout({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400.h,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.4,
                child: Lottie.asset(
                  "$assetsLotties/error.json",
                  options: LottieOptions(enableMergePaths: true),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.125,
                child: Text(
                  "Error".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 35.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.035,
              ),
              Container(
                height: constraints.maxHeight * 0.125,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  message.tr,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.025,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.125,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.h),
                    ),
                    side: BorderSide(
                      color: Colors.red.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    "Try Again".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
            ],
          );
        },
      ),
    );
  }
}
