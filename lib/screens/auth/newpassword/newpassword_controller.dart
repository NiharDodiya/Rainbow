import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyphone_screen.dart';
import 'package:rainbow/utils/strings.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController(text: "123Test@");
  TextEditingController confirmPasswordController = TextEditingController(text: "123Test@");

  void onSignUpTap() {
    // Get.to(() => RegisterScreen());
  }

  void onRegisterTap() {
    if (validation()) {
       Get.to(() => const VerifyPhoneScreen());
    }
  }

  bool validation() {
    if (newPasswordController.text.isEmpty) {
      errorToast(Strings.newPasswordError);
      return false;
    } else if (validatePassword(newPasswordController.text) == false) {
      errorToast(Strings.newPasswordError);
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorToast(Strings.coPasswordEmpty);
      return false;
    } else if (validatePassword(confirmPasswordController.text) == false) {
      errorToast(Strings.confirmShortPassword);
      return false;
    }else if (confirmPasswordController.text !=newPasswordController.text ) {
      errorToast(Strings.confirmPasswordMismatch);
      return false;
    }
    return true;
  }
}
