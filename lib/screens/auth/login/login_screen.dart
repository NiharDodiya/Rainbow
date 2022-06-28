import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/auth_dashboard/auth_dashboard.dart';
import 'package:rainbow/screens/auth/login/login_controller.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_screen.dart';
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
        body: GetBuilder<LoginController>(
          id: "Login",
          builder: (controller) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height * 0.81,
                      width: width,
                      margin: EdgeInsets.all(Get.width * 0.02669),
                      decoration: BoxDecoration(
                          color: ColorRes.color_4F359B,
                          borderRadius: BorderRadius.circular(25)),
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
              ),
            );
          },
        ));
  }

  Widget logoRainbow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.08,
        ),
        Center(
          child: Container(
            height: height * 0.13,
            width: width * 0.84,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetRes.rainBowLogo), fit: BoxFit.fill)),
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: Get.height * 0.0514,
            width: Get.width * 0.6028,
            child: Text(
              Strings.welcomeBack,
              style: textStyleFont30WhiteBold,
            ),
          ),
        )
      ],
    );
  }

  Widget textFields(LoginController loginController) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.35, left: 5),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          /*      Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                Strings.userName,
                style: textStyleFont14White600,
              ),
            ),
          ),*/
          /*SizedBox(height: height * 0.02),*/
          Center(
            child: SizedBox(
              width: width * 0.85,
              child: AppTextFiled(
                controller: loginController.emailController,
                title: Strings.userName,
                hintText: Strings.emailExample,
                textInputType: TextInputType.emailAddress,
              ),
            ),
          ),

          /*    Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                Strings.password,
                style: textStyleFont14White600,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),*/
          Center(
            child: SizedBox(
              width: width * 0.85,
              child: AppTextFiled(
                controller: loginController.passwordController,
                title: Strings.password,
                hintText: Strings.passwordExample,
                obscure: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(onTap:loginController.onForgotPassword,
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
          ),
        ],
      ),
    );
  }

  Widget loginButton(LoginController loginController) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.67),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                loginController.onRegisterTap();
                // Get.to(const GetStartedScreens());
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
          height: height * 0.016,
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
          height: height * 0.028,
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
