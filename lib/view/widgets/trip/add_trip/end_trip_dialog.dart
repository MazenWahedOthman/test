import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:task/controller/trip/add_trip_controller.dart';
import 'package:task/core/constants/strings.dart';
import 'package:task/view/common/app/my_elevated_button.dart';

class EndTripDialog extends StatelessWidget {
  EndTripDialog({super.key});

  final AddTripController addTripController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 310.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        width: 300.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 125.h,
              width: 125.w,
              child: Lottie.asset(
                "$assetsLotties/success.json",
                options: LottieOptions(enableMergePaths: true),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              "You have arrived at your destination",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 25.h),
            MyElevatedButton(
              title: "Trip Summary",
              height: 40.h,
              onPress: addTripController.onTapTripSummary,
            )
          ],
        ),
      ),
    );
  }
}
