import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/core/constants/colors.dart';
import 'package:task/view/common/app/my_icon_button.dart';

class TripSummarySliverAppBar extends StatelessWidget {
  const TripSummarySliverAppBar({
    super.key,
    required this.elevation,
  });
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      forceElevated: true,
      scrolledUnderElevation: elevation,
      snap: true,
      floating: true,
      leading: MyIconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
      title: Text(
        "Trip Summary",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
