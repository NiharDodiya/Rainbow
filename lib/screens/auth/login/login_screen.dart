import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/common/Widget/loaders.dart';
import 'package:rainbow/common/Widget/text_field.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/auth/login/login_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
            () {
          if (controller.loader.isTrue) {
            return SmallLoader();
          }
          return GetBuilder<LoginController>(
            id: "Login",
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.fromLTRB(
                        Get.width * 0.02667,
                        Get.width * 0.02667,
                        Get.width * 0.02667,
                        0,
                      ),
                      decoration: BoxDecoration(
                        color: ColorRes.color_4F359B,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              logoRainbow(),
                              textFields(controller),
                              loginButton(controller)
                            ],
                          ),
                        ],
                      ),
                    ),
                    signUp(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget logoRainbow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.1429),
        Center(
          child: Container(
            height: Get.height * 0.1207,
            width: Get.width * 0.84,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetRes.rainBowLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.06),
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
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07467),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.044),
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
          AppTextFiled(
            controller: loginController.emailController,
            title: Strings.userName,
            hintText: Strings.emailExample,
            textInputType: TextInputType.emailAddress,
            titleBottomPadding: 16,
            bottomPadding: 6,
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
          AppTextFiled(
            controller: loginController.passwordController,
            title: Strings.password,
            hintText: Strings.passwordExample,
            obscure: true,
            titleBottomPadding: 16,
            bottomPadding: 7,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: loginController.onForgotPassword,
              child: Text(
                Strings.forgotPassword,
                style: TextStyle(
                  color: ColorRes.white.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: "Gilroy-Light",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton(LoginController loginController) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.02463),
        SubmitButton(
          text: Strings.login,
          onTap: loginController.onRegisterTap,
        ),
        SizedBox(height: Get.height * 0.03202),
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
        ),
        SizedBox(height: Get.height * 0.02463),
      ],
    );
  }

  Widget signUp() {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.02463),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.dontHaveAccount,
              style: textStyleFont14Black,
            ),
            InkWell(
              onTap: controller.onSignUpTap,
              child: Text(
                Strings.sign_Up,
                style: textStyleFont14,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.025),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: controller.onSignUpTap,
              child: Text(
                Strings.signUp,
                style: textStyleFont14,
              ),
            ),
            Text(
              Strings.forAdvertise,
              style: textStyleFont14Black,
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.02463),
      ],
    );
  }
}
