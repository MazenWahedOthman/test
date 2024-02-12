import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgrss extends StatelessWidget {
  const CircularProgrss({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
