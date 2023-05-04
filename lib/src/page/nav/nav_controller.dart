import 'package:get/get.dart';

class NavController extends GetxController {
  var selectIndex = 0.obs;
  var autoTriggerNav = false.obs;

  void updateNav(int index) {
    selectIndex.value = index;
    update();
  }
}
