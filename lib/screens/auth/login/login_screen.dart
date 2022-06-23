import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/auth/login/login_controller.dart';
import 'package:rainbow/screens/getstarted_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.86,
                width: width,
                decoration: const BoxDecoration(
                    color: ColorRes.color_4F359B,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        logoRainbow(),
                        textFields(loginController),
                        loginButton(loginController)
                      ],
                    ),
                  ],
                ),
              ),
              signUp()
            ],
          ),
        ));
  }

  Widget logoRainbow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.10,
        ),
        Center(
          child: Container(
            height: height * 0.120,
            width: width * 0.84,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(AssetRes.rainBowLogo))),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              Strings.welcomeBack,
              style: textStyleFont30WhiteBold,
            ))
      ],
    );
  }

  Widget textFields(LoginController loginController) {
    return Form(
      key: loginController.formKey,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.35),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  Strings.userName,
                  style: textStyleFont14White600,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: SizedBox(
                height: height * 0.073,
                width: width * 0.85,
                child: TextFormField(
                    controller: loginController.emailController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                            color: ColorRes.color_656F85..withOpacity(0.5),
                            fontSize: 18,
                            fontFamily: "Gilroy-Light",
                            fontWeight: FontWeight.w500),
                        hintText: "Enter Email",
                        fillColor: ColorRes.color_F7F7F7)),
              ),
            ),
            SizedBox(height: height * 0.01),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  Strings.password,
                  style: textStyleFont14White600,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: SizedBox(
                height: height * 0.073,
                width: width * 0.85,
                child: TextFormField(
                    validator: (value) {
                      if (value!.length > 6) {
                        return "";
                      } else {
                        return "Password must be atleast 6 characters ";
                      }
                    },
                    controller: loginController.passwordController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                            color: ColorRes.color_656F85..withOpacity(0.5),
                            fontSize: 18,
                            fontFamily: "Gilroy-Light",
                            fontWeight: FontWeight.w500),
                        hintText: "Enter Password",
                        fillColor: ColorRes.color_F7F7F7)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  Strings.forgotPassword,
                  style: TextStyle(
                      color: ColorRes.white.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: "Gilroy-Light",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(LoginController loginController) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.70),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const GetStartedScreens());
              },
              child: Container(
                width: width * 0.84,
                height: height * 0.073,
                decoration: BoxDecoration(
                    color: ColorRes.color_E7D01F,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  Strings.login,
                  style: textStyleFont16BlackLight,
                )),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.log_in,
                  style: textStyleFont14WhiteBold,
                ),
                Text(
                  Strings.loginAsAdvertiser,
                  style: textStyleFont14White,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return Column(
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.dontHaveAccount,
              style: textStyleFont14Black,
            ),
            InkWell(
              onTap: loginController.onSignUpTap,
              child: Text(
                Strings.sign_Up,
                style: textStyleFont14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.signUp,
              style: textStyleFont14,
            ),
            Text(
              Strings.forAdvertise,
              style: textStyleFont14Black,
            ),
          ],
        )
      ],
    );
  }
}
