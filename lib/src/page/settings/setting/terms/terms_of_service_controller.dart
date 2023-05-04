import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TermsOfServiceController extends GetxController {
  var termsOfService = "".obs;

  @override
  void onInit() {
    super.onInit();
    readTermsOfService();
  }
  Future<void> readTermsOfService() async {
    String filePath = 'assets/law/terms-of-service.md';
    String fileData = await rootBundle.loadString(filePath);
    termsOfService.value = fileData;
  }

  TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 18);
}