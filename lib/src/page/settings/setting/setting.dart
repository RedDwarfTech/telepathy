import 'package:avatars/avatars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telepathy/src/page/home/home.dart';
import '../../nav/nav.dart';
import '/src/page/settings/user/login/login.dart';
import '/src/page/settings/user/profile/profile.dart';
import '../../../../generated/locales.g.dart';
import 'about/about.dart';
import 'language/language.dart';
import 'privacy/privacy.dart';
import 'setting_controller.dart';
import 'terms/terms_of_service.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {

          void tapProfile(){
            if (controller.isLoggedIn()) {
              Get.to(() => Profile());
            } else {
              Get.to(() => Login());
            }
          }

          return Scaffold(
              backgroundColor: Color.fromRGBO(235, 233, 241, 1),
              appBar: AppBar(
                leading: Container(),
                backgroundColor: Color.fromRGBO(235, 233, 241, 1),
                title: Text(
                  LocaleKeys.appbar_setting.tr,
                  style: controller.textStyle,
                ),
              ),
              body: SafeArea(
                  child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Avatar(
                                onTap: () => {tapProfile()},
                                name: controller.isLoggedIn() ? controller.currentUser.value.nickName : 'Unknown'),
                          ),
                          SizedBox(width: 16.0),
                          Obx(() => GestureDetector(
                              onTap: () => {tapProfile()},
                              child: Text(
                                controller.isLoggedIn() ? controller.currentUser.value.nickName : LocaleKeys.tip_not_login.tr,
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ))),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.language,
                              color: Colors.teal,
                            ),
                            title: Text(LocaleKeys.menu_language.tr),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () => {Get.to(Language())},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.privacy_tip,
                              color: Colors.pinkAccent,
                            ),
                            title: Text(LocaleKeys.menu_privacy.tr),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () => {Get.to(Privacy())},
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(
                              Icons.abc,
                              color: Colors.green,
                            ),
                            title: Text(LocaleKeys.menu_terms.tr),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () => {Get.to(TermsOfService())},
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(
                              Icons.adb,
                              color: Colors.teal,
                            ),
                            title: Text(LocaleKeys.menu_about.tr),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () => {Get.to(About())},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )));
        });
  }
}
