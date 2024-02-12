import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/constants/colors.dart';

class TripSummaryCardInfo extends StatelessWidget {
  const TripSummaryCardInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            color: textColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
