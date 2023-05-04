import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/src/page/settings/setting/setting.dart';
import 'package:wheel/wheel.dart';
import '../../../../../generated/locales.g.dart';
import '../../setting/setting_controller.dart';
import './profile_controller.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {

          void logout(){
            Auth.logout();
            final settingController = Get.find<SettingController>();
            settingController.isLoggedIn.value = false;
            Get.to(()=>Setting());
          }

          return Scaffold(
              body: SafeArea(
              child:Center(
                  child:  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.logout,
                                  color: Colors.teal,
                                ),
                                title: Text(LocaleKeys.buttons_logout.tr),
                                onTap: () => {logout()},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              )
          )
          );
        });
  }
}
