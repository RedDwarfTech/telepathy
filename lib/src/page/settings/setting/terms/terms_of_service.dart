import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'terms_of_service_controller.dart';

class TermsOfService extends StatelessWidget {

  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TermsOfServiceController>(
        init: TermsOfServiceController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(
                  child:SingleChildScrollView(
                      child:Padding(
                          padding: EdgeInsets.all(16.0),
                          child:Obx(()=>MarkdownBody(data: controller.termsOfService.value))
                      ))));
        }
    );
  }
}