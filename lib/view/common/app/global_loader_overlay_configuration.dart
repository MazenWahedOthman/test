import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:task/core/theme/theme_app.dart';

class GlobalLoaderOverlayConfiguration extends StatelessWidget {
  const GlobalLoaderOverlayConfiguration({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black.withOpacity(0.2),
      overlayWidgetBuilder: (_) => Center(
        child: SpinKitFadingCircle(
          color: ThemeApp.themeLight.primaryColor,
          size: 50.0.sp,
        ),
      ),
      child: child,
    );
  }
}
