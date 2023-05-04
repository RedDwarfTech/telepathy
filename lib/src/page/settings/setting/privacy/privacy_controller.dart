import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  var privacyPolicy = "".obs;

  @override
  void onInit() {
    super.onInit();
    readPrivacy();
  }
  Future<void> readPrivacy() async {
    String filePath = 'assets/law/privacy.md';
    String fileData = await rootBundle.loadString(filePath);
    privacyPolicy.value = fileData;
  }

  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 18);
}
