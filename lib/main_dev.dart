import '/src/common/config/app_global_config.dart';
import 'package:wheel/wheel.dart';

void main() {
  CommonUtils.initialApp(ConfigType.DEV).whenComplete(() => {AppGlobalConfig.loadApp(ConfigType.DEV)});
}