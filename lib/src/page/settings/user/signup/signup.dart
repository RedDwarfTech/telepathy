import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/signup_body.dart';
import 'signup_controller.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(body: SafeArea(
              child:Center(
                  child:  SignupBody()
              )
          )
          );
        });
  }
}
