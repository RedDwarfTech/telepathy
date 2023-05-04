import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../setting_controller.dart';
import 'language_controller.dart';

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          final settingController = Get.find<SettingController>();
          void _changeLanguage(Locale locale) {
            settingController.updateLocale(locale);
          }

          return Scaffold(
              backgroundColor: Color.fromRGBO(235, 233, 241, 1),
              body: SafeArea(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("English"),
                                  onTap: () => _changeLanguage(const Locale('en', 'US')),
                                  trailing: Checkbox(
                                    value: Get.locale == Locale('en', 'US'),
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      settingController.updateLocale(Locale('en', 'US'));
                                    },
                                  ),
                                ),
                                Divider(height: 2,thickness:1),
                                ListTile(
                                  title: Text('中文'),
                                  onTap: () => _changeLanguage(const Locale('zh', 'CN')),
                                  trailing: Checkbox(
                                    value: Get.locale  == Locale('zh', 'CN'),
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      settingController.updateLocale(Locale('zh', 'CN'));
                                    },
                                  ),
                                ),
                                Divider(height: 2,thickness:1),
                              ],
                            ),
                          ),
                        ],
                      ))));
        });
  }
}
