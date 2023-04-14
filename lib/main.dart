
import 'package:telepathy/src/common/config/telepathy_global_config.dart';
import 'package:wheel/wheel.dart';

void main() async {
  CommonUtils.initialApp(ConfigType.PRO).whenComplete(() => {TelepathyGlobalConfig.loadApp(ConfigType.PRO)});
}

