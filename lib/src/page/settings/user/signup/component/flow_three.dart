import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../common/components/my_button.dart';
import '../../login/login.dart';
import '../signup_controller.dart';
import 'flow_controller.dart';

class SignUpThree extends StatefulWidget {
  const SignUpThree({super.key});

  @override
  State<SignUpThree> createState() => _SignUpThreeState();
}

class _SignUpThreeState extends State<SignUpThree> {
  SignupController signUpController =
      Get.put(SignupController(), permanent: false);
  Future signUserUp() async {
    // create user

  }

  String basename(String path) => basename(path);

  Future uploadImageFile() async {

  }

  Future uploadPdfFile() async {

  }

  FlowController flowController = Get.put(FlowController());

  @override
  Widget build(BuildContext context) {
    SignupController signUpController =
        Get.put(SignupController(), permanent: false);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    flowController.setFlow(2);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 67,
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#4f4f4f"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (signUpController.userType == "Student") ...[
                    Text(
                      "Admission Year",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: HexColor("#8d8d8d"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: (value) {
                        signUpController.setAdmissionYear(value);
                      },
                      onSubmitted: (value) {
                        signUpController.setAdmissionYear(value);
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor("#4f4f4f"),
                      decoration: InputDecoration(
                        hintText: "2020",
                        fillColor: HexColor("#f0f3f1"),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#8d8d8d"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ] else if (signUpController.userType == "Alumni") ...[
                    Text(
                      "Passout Year",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: HexColor("#8d8d8d"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: (value) {
                        signUpController.setPassOutYear(value);
                      },
                      onSubmitted: (value) {
                        signUpController.setPassOutYear(value);
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor("#4f4f4f"),
                      decoration: InputDecoration(
                        hintText: "2020",
                        fillColor: HexColor("#f0f3f1"),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#8d8d8d"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ] else
                    ...[],
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Profile Picture",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: HexColor("#8d8d8d"),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      textStyle: MaterialStateProperty.all<TextStyle?>(
                        GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#4f4f4f"),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.fromLTRB(90, 15, 90, 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#fed8c3")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                    ),
                    onPressed: () async {
                      uploadImageFile();
                      setState(() {
                        int i = 1 + 1;
                      });
                    },
                    child: const Text("Upload an image"),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  GetBuilder<SignupController>(builder: (context) {
                    return Text(
                      signUpController.imageFile != null
                          ? signUpController.imageFile!.filename
                          : "No file selected",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: HexColor("#8d8d8d"),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Resume (Optional)",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: HexColor("#8d8d8d"),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      textStyle: MaterialStateProperty.all<TextStyle?>(
                        GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#4f4f4f"),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.fromLTRB(80, 15, 80, 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor("#fed8c3")),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                    ),
                    onPressed: () {
                      uploadPdfFile();
                    },
                    child: const Text("Upload your resume"),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  GetBuilder<SignupController>(builder: (context) {
                    return Text(
                      signUpController.resumeFile == null
                          ? "No file selected"
                          : signUpController.resumeFile!.filename,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: HexColor("#8d8d8d"),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 5,
                  ),
                  MyButton(
                    onPressed: () {
                      if (signUpController.userType == 'Student' &&
                              signUpController.imageFile != null &&
                              signUpController.admissionYear != null ||
                          signUpController.userType == 'Alumni' &&
                              signUpController.imageFile != null &&
                              signUpController.passOutYear != null ||
                          signUpController.userType == 'Teacher' &&
                              signUpController.imageFile != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                        signUserUp();
                        signUpController.uploadImageFile();
                      } else {
                        Get.snackbar("Error", "Please fill all the fields");
                      }

                      signUpController.uploadResumeFile();
                    },
                    buttonText: 'Submit',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
