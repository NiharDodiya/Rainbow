import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/idScanner/idscaneer_screen.dart';
import 'package:rainbow/utils/strings.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void onSignUpTap() {
    // Get.to(() => RegisterScreen());
  }

  void onRegisterTap() {
    if (validation()) {
      // Get.to(() => IdScannerScreen());
    }
  }

  bool validation() {
    if (newPasswordController.text.isEmpty) {
      errorToast(Strings.newPasswordError);
      return false;
    } else if (validatePassword(newPasswordController.text)) {
      errorToast(Strings.newPasswordError);
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorToast(Strings.confirmPassword);
      return false;
    } else if (validatePassword(confirmPasswordController.text)) {
      errorToast(Strings.confirmPassword);
      return false;
    }
    return true;
  }
}
