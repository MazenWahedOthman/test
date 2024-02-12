import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task/core/functions/app/initial_services_app.dart';
import 'package:task/core/functions/app/setup_locator_app.dart';
import 'package:task/core/functions/ui/set_system_ui_overlay_style.dart';
import 'package:task/core/locale/app/locale_app.dart';
import 'package:task/core/locale/app/locale_controller.dart';
import 'package:task/core/routers/router_app.dart';
import 'package:task/core/routers/screens.dart';
import 'package:task/core/theme/theme_app.dart';
import 'package:task/services/app/setting_service.dart';
import 'package:task/view/common/app/config_app.dart';
import 'package:task/view/common/app/global_loader_overlay_configuration.dart';
import 'package:task/view/common/app/screen_util_initial_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemUIAdapter.setOverlayStyle();
  await setupLocatorApp();
  await initServicesApp();
  runApp(MyTask());
}

class MyTask extends StatelessWidget {
  MyTask({super.key});

  final SettingService settingService = Get.find();
  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return ConfigApp(
      child: ScreenUtilInitApp(
        builder: (ctx, child) => GlobalLoaderOverlayConfiguration(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task',
            translations: LocaleApp(),
            locale: localeController.localeApp,
            initialRoute:
                settingService.isAuth ? Screens.addTrip : Screens.signIn,
            theme: ThemeApp.themeLight,
            getPages: RouterApp.getPages,
          ),
        ),
      ),
    );
  }
}
