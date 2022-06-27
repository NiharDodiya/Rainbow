import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/utils/strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onSignUpTap() {
    Get.to(() => RegisterScreen());
  }

  void onRegisterTap() {
    if (validation()) {}
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      errorToast(Strings.emailError1);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError1);
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
}
