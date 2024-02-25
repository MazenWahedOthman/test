import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task/controller/trip/add_trip_controller.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/core/packages/screen_utils.dart';
import 'package:task/view/common/app/my_icon_button.dart';
import 'package:task/view/widgets/trip/add_trip/input_location.dart';

class TripLocation extends StatelessWidget {
  TripLocation({super.key});

  final AddTripController addTripController = Get.find();

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = ScreenUtils.isLandscape;
    return Container(
      height: isLandscape ? 175.h : 150.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 52.h,
            child: InputLocation(
              hintText: "Start",
              icon: Icon(
                FluentIcons.location_20_filled,
                color: textColor,
                size: 30.sp,
              ),
              suffixIcon: Obx(
                () => addTripController.isSelectStartLocation.value
                    ? MyIconButton(
                        onPressed: addTripController.onDeleteStartLocation,
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                      )
                    : Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                        size: 20.sp,
                      ),
              ),
              controller: addTripController.startLocationController,
              onSave: (address) => addTripController.getLatLngFromAddress(
                isStart: true,
                locationName: address,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 52.h,
            child: InputLocation(
              hintText: "Destination",
              icon: Icon(
                FluentIcons.location_target_square_20_regular,
                color: textColor,
                size: 30.sp,
              ),
              suffixIcon: Obx(
                () => addTripController.isSelectEndLocation.value
                    ? MyIconButton(
                        onPressed: addTripController.onDeleteEndLocation,
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue,
                          size: 20.sp,
                        ),
                      )
                    : Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 20.sp,
                      ),
              ),
              controller: addTripController.endLocationController,
                 onSave: (address) => addTripController.getLatLngFromAddress(
                isStart: false,
                locationName: address,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
