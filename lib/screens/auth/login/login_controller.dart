import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_screen.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/utils/strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  RxBool loader = false.obs;

  void onSignUpTap() {
    Get.off(() => RegisterScreen(), transition: Transition.cupertino);
  }

  void onRegisterTap() {
    if (validation()) {
      registerDetails();
    }
  }

  void onForgotPassword() {
    Get.to(() => const NewPasswordScreen());
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (passwordController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    } else if (validatePassword(passwordController.text) == false) {
      errorToast(Strings.passwordValidError);
      return false;
    }
    return true;
  }

  Future<void> registerDetails() async {
    loader.value = true;
    await LoginApi.postRegister(
      emailController.text,
      passwordController.text,
    );
    loader.value = false;
    Get.to(()=>const Dashboard());
  }
}
