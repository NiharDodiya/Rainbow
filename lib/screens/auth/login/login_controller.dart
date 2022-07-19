import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_Screen.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/register_adviser.dart';
import 'package:rainbow/utils/strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loader = false.obs;
  bool advertiser = false;

  void onSignUpTap() {
    // Get.off(() => RegisterScreen(), transition: Transition.cupertino);
    Get.off(
      () => !advertiser ? AdviserRegisterScreen() : RegisterScreen(),
    );
  }

  void onTapAsLogin() {
    advertiser = !advertiser;
    update(['as']);
  }

  void onSignUpDontHaveTap() {
    Get.off(() => advertiser ? AdviserRegisterScreen() : RegisterScreen(),
        transition: Transition.cupertino);

    // Get.off(() => AdviserRegisterScreen(), );
  }

  void onLoginTap() {
    if (validation()) {
      registerDetails();
    }
  }

  void onForgotPassword() {
    Get.to(() => PhoneNumberScreen());
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
    }
    return true;
  }

  LoginModel loginModel = LoginModel();

  Future<void> registerDetails() async {
    loader.value = true;
    try {
      await LoginApi.postRegister(
        emailController.text,
        passwordController.text,
      );
      loader.value = false;
      // await PrefService.setValue(PrefKeys.accessToken, loginModel.token);
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
