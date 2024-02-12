import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showSnackBar({
    required String message,
    IconData icon = FluentIcons.warning_20_regular,
    double? offsetY,
    Color? backgroundColor,
    bool withBorder = true,
  }) async {
    ScaffoldMessenger.of(Get.context!)
      ..removeCurrentSnackBar()
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: withBorder
                ? const BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  )
                : BorderSide.none,
          ),
          backgroundColor:
              backgroundColor ?? Theme.of(Get.context!).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          elevation: 0,
          content: Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(.85),
                size: 20.sp,
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Text(
                  message.tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ).closed;
  }
}
