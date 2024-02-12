import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.radius,
  });

  final void Function() onPressed;
  final Widget icon;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 25.h,
      width: 35.w,
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: InkResponse(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50.r),
        radius: radius ?? 20.r,
        child: icon,
      ),
    );
  }
}
