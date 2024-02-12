import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/view/widgets/trip/add_trip/end_trip_dialog.dart';

class AppDialog {
  static Future endTripDialog() async {
    return showGeneralDialog(
      context: Get.context!,
      barrierLabel: '',
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, anim1, anim2, widget) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -0.075),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(anim1),
            child: widget,
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return EndTripDialog();
      },
    );
  }
}
