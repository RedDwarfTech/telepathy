import '/src/common/config/app_global_config.dart';
import 'package:wheel/wheel.dart';

void main() {
  CommonUtils.initialApp(ConfigType.PRO).whenComplete(() => {AppGlobalConfig.loadApp(ConfigType.PRO)});
}