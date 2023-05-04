import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/page/settings/user/login/login.dart';
import 'package:wheel/wheel.dart';
import '../../../generated/locales.g.dart';
import '../nav/nav.dart';
import '../settings/setting/setting_controller.dart';
import 'global_controller.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ThemeManager.fromThemeName("lightTheme");
    Get.put(SettingController());

    Widget buildHomePage() {
      return new Nav();
    }

    return GetBuilder<GlobalController>(
        init: GlobalController(),
        builder: (controller) {
          final settingController = Get.find<SettingController>();

          return GetMaterialApp(
            title: 'SleepEase',
            theme: currentTheme,
            navigatorKey: NavigationService.instance.navigationKey,
            checkerboardOffscreenLayers: controller.showDebug,
            checkerboardRasterCacheImages: controller.showDebug,
            showPerformanceOverlay: controller.showDebug,
            translationsKeys: AppTranslation.translations,
            locale: settingController.getLocale(),
            fallbackLocale:Locale('en', 'US'),
            routes: {
            },
            home: buildHomePage(),
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == '/login') {
                return MaterialPageRoute(
                  builder: (context) => Login(),
                );
              }
            },
          );
        });
  }
}
