import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wheel/wheel.dart';

class SettingController extends GetxController {
  var themeMode = ThemeMode.system.obs;
  var isLoggedIn = false.obs;
  late Rx<AppUser> currentUser = AppUser(phone: "0", registerTime: "0", nickName: "unknown").obs;

  TextStyle textStyle = TextStyle(
    color: Colors.black,
  );

  @override
  void onInit() {
    super.onInit();
    var box = GetStorage();
    if (box.hasData('themeMode')) {
      themeMode.value = ThemeMode.values[box.read('themeMode')];
    }
    if(box.hasData("locale")){
      String local = box.read("locale");
      Get.updateLocale(localeFromJson(local));
    }
    checkCurrentUser();
    checkLoginStatus();
  }

  Future<void> checkCurrentUser() async {
    if(await Auth.isLoggedIn()) {
      AppUser appUser = await Auth.currentUser();
      currentUser.value = appUser;
    }
  }

  Future<void> checkLoginStatus() async {
   bool isUserLoggedIn = await Auth.isLoggedIn();
   isLoggedIn.value = isUserLoggedIn;
  }

  String localeToJson(Locale locale) {
    return json.encode({
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    });
  }

  Locale localeFromJson(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Locale(jsonMap['languageCode'], jsonMap['countryCode']);
  }

  Locale getLocale(){
    var box = GetStorage();
    if(box.hasData("locale")){
      String local = box.read("locale");
      return localeFromJson(local);
    }
    return Locale("en","US");
  }

  void updateLocale(Locale newLocale){
    Get.updateLocale(newLocale);
    var box = GetStorage();
    box.write('locale', localeToJson(newLocale));
    Get.forceAppUpdate();
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    var box = GetStorage();
    box.write('themeMode', mode.index);
  }
}