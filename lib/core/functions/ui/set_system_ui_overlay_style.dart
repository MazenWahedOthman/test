import 'package:flutter/material.dart';
import 'package:status_bar_control/status_bar_control.dart';

class SystemUIAdapter {
  static Future<void> setOverlayStyle() async {
    StatusBarControl.setColor(
      Colors.transparent,
      animated: true,
    );

    StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
  }
}
