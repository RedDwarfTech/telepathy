import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:wheel/wheel.dart' show AppLogHandler, GlobalConfig;
import 'package:wheel/wheel.dart';

import '../../page/app/app_page.dart';

final pageStorageBucket = PageStorageBucket();
final InAppPurchase inAppPurchase = InAppPurchase.instance;

class AppGlobalConfig {
  static void loadApp(ConfigType configType) async {
    GlobalConfig.init(configType);
    void _handleError(Object obj, StackTrace stack) {
      AppLogHandler.logErrorStack("global error", obj, stack);
    }

    runZonedGuarded(() {
      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        AppLogHandler.logFlutterErrorDetails(errorDetails);
      };
      runApp(AppPage());
    }, (Object error, StackTrace stackTrace) {
      _handleError(error, stackTrace);
    });
  }
}
