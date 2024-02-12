import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/core/constants/colors.dart';

class ThemeApp {
  static ThemeData get themeLight {
    return ThemeData(
      useMaterial3: false,
      fontFamily: "Muli",
      primaryColor: primaryColor,
      dividerTheme: DividerThemeData(
        color: Colors.grey[200],
        thickness: 0.5.sp,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: textColor,
        ),
        bodyMedium: TextStyle(
          color: textColor,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
      ),
    );
  }
}
