import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:task/controller/trip/trip_summary_controller.dart';
import 'package:task/core/constants/status.dart';
import 'package:task/view/widgets/trip/trip_summary/circular_progress.dart';
import 'package:task/view/widgets/trip/trip_summary/error_layout.dart';
import 'package:task/view/widgets/trip/trip_summary/trip_summary_cards.dart';
import 'package:task/view/widgets/trip/trip_summary/trip_summary_sliver_appbar.dart';

class TripSummaryScreen extends StatelessWidget {
  TripSummaryScreen({super.key});

  final TripSummaryController tripSummaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TripSummarySliverAppBar(
              elevation: innerBoxIsScrolled ? 5.h : 0,
            ),
          ],
          physics: const BouncingScrollPhysics(),
          body: Obx(() {
            final String state = tripSummaryController.state.value;
            if (state == States.loading) {
              return const CircularProgrss();
            }

            if (state == States.error) {
              return Center(
                child: ErrorLayout(
                  message: tripSummaryController.exception.message,
                  onPressed: tripSummaryController.onTryAgain,
                ),
              );
            }
            return TripSummaryCards();
          }),
        ),
      ),
    );
  }
}
