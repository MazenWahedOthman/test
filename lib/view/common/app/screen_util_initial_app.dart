import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/core/packages/screen_utils.dart';

class ScreenUtilInitApp extends StatelessWidget {
  const ScreenUtilInitApp({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, Widget?) builder;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final bool isLandscape = data.orientation == Orientation.landscape;
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) => isLandscape
          ? instance.setHeight(fontSize)
          : instance.setWidth(fontSize),
      builder: (context, child) {
        final data = MediaQueryData.fromView(View.of(context));
        final bool isLandscape = data.orientation == Orientation.landscape;
        final bool isPortrait = data.orientation == Orientation.portrait;
        final bool isTablet = data.size.shortestSide >= 600;
        ScreenUtils.init(
          isPortrait: isPortrait,
          isLandscape: isLandscape,
          isTablet: isTablet,
        );
        return builder(context, child);
      },
    );
  }
}
