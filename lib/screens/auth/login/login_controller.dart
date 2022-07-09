import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_screen.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_Screen.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/register_adviser.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class LoginController extends GetxController {
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  RxBool loader = false.obs;

  void onSignUpTap() {
    // Get.off(() => RegisterScreen(), transition: Transition.cupertino);
    Get.off(() => AdviserRegisterScreen(), );
  }
void onSignUpDontHaveTap() {
    Get.off(() => RegisterScreen(), transition: Transition.cupertino);
    // Get.off(() => AdviserRegisterScreen(), );
  }

  void onRegisterTap() {
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
    } else if (validatePassword(passwordController.text) == false) {
      errorToast(Strings.confirmShortPassword);
      return false;
    }
    return true;
  }
  LoginModel loginModel = LoginModel();
  Future<void> registerDetails() async {
    loader.value = true;
    try{
      await LoginApi.postRegister(
        emailController.text,
        passwordController.text,
      ).then((value) =>loginModel=value);
      loader.value = false;
      await PrefService.setValue(PrefKeys.accessToken,loginModel.token);
    }catch(e){
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
