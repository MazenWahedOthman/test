import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/services/app/setting_service.dart';

class LocaleController extends GetxController {
  Locale localeApp;

  LocaleController._({required this.localeApp});

  factory LocaleController() {
    final SettingService settingService = Get.find();
    final Locale localeApp = Locale(settingService.getCodeLang());
    return LocaleController._(localeApp: localeApp);
  }

  Future<void> changeLang(String langCode) async {
    final SettingService settingService = Get.find();
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    settingService.setCodeLang(langCode);

    bool isLTR = langCode != "ar";

    settingService.changeLtr(isLTR);
  }

  void selectLang(String codeLang) {
    Get.back();
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      changeLang(codeLang);
    });
  }
}
