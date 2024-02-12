import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task/controller/trip/trip_summary_controller.dart';
import 'package:task/view/widgets/trip/trip_summary/trip_summary_card.dart';
import 'package:task/view/widgets/trip/trip_summary/trip_summary_card_info.dart';

class TripSummaryCards extends StatelessWidget {
  TripSummaryCards({super.key});

  final TripSummaryController tripSummaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                  title: "Start Location",
                  value: tripSummaryController.trip.startLocation),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                  title: "End Location",
                  value: tripSummaryController.trip.endLocation),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                title: "Distance",
                value: tripSummaryController.trip.distance?.text ?? "",
              ),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                title: "Start Time",
                value: tripSummaryController.trip.startTime,
              ),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                title: "End Time",
                value: tripSummaryController.trip.endTime,
              ),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                title: "Duration",
                value: tripSummaryController.trip.duration,
              ),
            ),
            SizedBox(height: 20.h),
            TripSummaryCard(
              cardBody: TripSummaryCardInfo(
                title: "Cost",
                value: tripSummaryController.trip.cost ?? "0 AED",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
