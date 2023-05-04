import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../nav/nav.dart';
import '/src/page/settings/setting/setting.dart';
import '/src/page/settings/user/signup/signup.dart';
import 'package:wheel/wheel.dart';
import '../../../../../common/components/my_button.dart';
import '../../../../../common/components/my_textfield.dart';
import '../../../setting/setting_controller.dart';
import 'login_body_controller.dart';
import 'package:get/get.dart';
import '/generated/locales.g.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginBodyController>(
        init: LoginBodyController(),
        builder: (controller) {
          final emailController = TextEditingController();
          final passwordController = TextEditingController();

          void showErrorMessage(String message) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(message),
                  );
                });
          }

          void signUserIn() async {
            AppLoginRequest appLoginRequest = AppLoginRequest(
                username: "+86" + controller.phone.value,
                password: controller.password.value,
                loginUrl: "/post/user/login",
                loginType: LoginType.PHONE);
            var resp = await Auth.login(appLoginRequest: appLoginRequest);
            if (RestClient.respSuccess(resp)) {
              final settingController = Get.find<SettingController>();
              settingController.isLoggedIn.value = true;
              Get.to(() => Nav());
            } else {
              showErrorMessage(resp.data["msg"]);
            }
          }

          String _errorMessage = "";

          void validatePhone(String val) {
            controller.phone.value = val;
          }

          return SafeArea(
              child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HexColor("#fed8c3"),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
              shrinkWrap: true,
              reverse: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 535,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HexColor("#ffffff"),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.buttons_login.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#4f4f4f"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.buttons_phone.tr,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: HexColor("#8d8d8d"),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MyTextField(
                                        onChanged: () => validatePhone(emailController.text),
                                        controller: emailController,
                                        hintText: "",
                                        obscureText: false,
                                        prefixIcon: const Icon(Icons.phone_android_outlined),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                        child: Text(
                                          _errorMessage,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        LocaleKeys.buttons_password.tr,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: HexColor("#8d8d8d"),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MyTextField(
                                        onChanged: (() {
                                          controller.password.value = passwordController.text;
                                        }),
                                        controller: passwordController,
                                        hintText: "",
                                        obscureText: true,
                                        prefixIcon: const Icon(Icons.lock_outline),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MyButton(
                                        onPressed: signUserIn,
                                        buttonText: LocaleKeys.buttons_submit.tr,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(LocaleKeys.tip_no_account.tr,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: HexColor("#8d8d8d"),
                                                )),
                                            TextButton(
                                                child: Text(
                                                  LocaleKeys.buttons_sign_up.tr,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    color: HexColor("#44564a"),
                                                  ),
                                                ),
                                                onPressed: () => {Get.to(() => Signup())}),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -253),
                          child: Image.asset(
                            'assets/images/plants2.png',
                            scale: 1.5,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ));
        });
  }
}
