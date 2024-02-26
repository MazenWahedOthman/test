import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task/controller/trip/add_trip_controller.dart';
import 'package:task/view/common/app/my_elevated_button.dart';

class FloatingActionStartTrip extends StatelessWidget {
  FloatingActionStartTrip({super.key});

  final AddTripController addTripController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) => Transform.translate(
                offset: Offset(0, 90.h * value),
                child: child!,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 15.h,
                  bottom: 15.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.r),
                    topRight: Radius.circular(18.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -10.h),
                      blurRadius: 20,
                      color: const Color(0xFFDADADA).withOpacity(0.3),
                    ),
                  ],
                ),
                child: MyElevatedButton(
                  title: "Start Trip",
                  onPress: addTripController.onTapStartTrip,
                ),
              ),
            );
          
  
  }
}
