import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardUtil {
  static void hideKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }
}
