import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/src/page/settings/user/login/component/login_body.dart';
import 'login_controller.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(body: SafeArea(
              child:Center(
                  child:  LoginBody()
              )
          )
          );
        });
  }
}
