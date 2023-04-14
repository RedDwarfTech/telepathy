import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          if (controller.autoTriggerNav.value) {
            //var homeModel = new HomeModel();
            //homeModel.selectIndex = controller.selectIndex.value;
            //homeModel.storiesType = controller.storiesType.value;
          }

          void _onItemTapped(int index) {

          }

          return Scaffold(
            body: new Text("dfgfgf"),
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: GestureDetector(
                          onDoubleTap: () {
                            //final HomeListDefaultController subListDefaultController = Get.put(HomeListDefaultController());
                            //subListDefaultController.updateScroll(true);
                          },
                          child: Icon(Icons.home)),
                      label: AppLocalizations.of(context)!.cruiseNavigatorHome),
                  BottomNavigationBarItem(
                      icon: GestureDetector(
                          onDoubleTap: () {
                            //final SubListDefaultController subListDefaultController = Get.put(SubListDefaultController());
                            //subListDefaultController.updateScrollUp(true);
                          },
                          child: Icon(Icons.subscriptions)),
                      label: AppLocalizations.of(context)!.cruiseNavigatorSubscribe),
                  BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: AppLocalizations.of(context)!.cruiseNavigatorChannel),
                  BottomNavigationBarItem(icon: Icon(Icons.school), label: AppLocalizations.of(context)!.cruiseNavigatorMine),
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
