import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/page/home/home.dart';
import '../../../generated/locales.g.dart';
import '../settings/setting/setting.dart';
import 'nav_controller.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
        init: NavController(),
        builder: (controller) {
          if (controller.autoTriggerNav.value) {}

          void _onItemTapped(int index) {
            controller.updateNav(index);
          }

          Widget currentMenu() {
            if (controller.selectIndex.value == 0) {
              return HomeDefault();
            }
            if (controller.selectIndex.value == 1) {
              return Setting();
            }
            return Text("开发中，敬请期待...");
          }

          return Scaffold(
            body: currentMenu(),
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: GestureDetector(onDoubleTap: () {}, child: Icon(Icons.home)), label: LocaleKeys.nav_home.tr),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: LocaleKeys.nav_settings.tr),
                ],
                currentIndex: controller.selectIndex.value,
                fixedColor: Theme.of(context).primaryColor,
                onTap: _onItemTapped,
                unselectedItemColor: Color(0xff666666),
                type: BottomNavigationBarType.fixed),
          );
        });
  }
}
