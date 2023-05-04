import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'privacy_controller.dart';

class Privacy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyController>(
        init: PrivacyController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(
                child:SingleChildScrollView(
              child:Padding(
                  padding: EdgeInsets.all(16.0),
                  child:Obx(()=>MarkdownBody(data: controller.privacyPolicy.value))
              ))));
        }
    );
  }
}