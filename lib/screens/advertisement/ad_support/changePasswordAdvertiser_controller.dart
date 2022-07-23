import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_api/newpasword_api.dart';
import 'package:rainbow/utils/strings.dart';

class ChangeAdvertiserController extends GetxController {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool loader = false.obs;

  void onSignUpTap() {
    // Get.to(() => RegisterScreen());
  }

  void onRegisterTap() {
    if (validation()) {
      createNewPassword();
    }
  }

  bool validation() {
    if (currentPassword.text.isEmpty) {
      errorToast(Strings.currentPasswordHint);
      return false;
    } else if (validatePassword(currentPassword.text) == false) {
      errorToast(Strings.confirmShortPassword);
      return false;
    } else if (newPasswordController.text.isEmpty) {
      errorToast(Strings.newPasswordError);
      return false;
    } else if (validatePassword(newPasswordController.text) == false) {
      errorToast(Strings.confirmShortPassword);
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      errorToast(Strings.coPasswordEmpty);
      return false;
    } else if (validatePassword(confirmPasswordController.text) == false) {
      errorToast(Strings.confirmShortPassword);
      return false;
    } else if (confirmPasswordController.text != newPasswordController.text) {
      errorToast(Strings.confirmPasswordMismatch);
      return false;
    }
    return true;
  }

  Future<void> createNewPassword() async {
    try {
      loader.value = true;
      await CreateNewPasswordApi.createPasswordAdvertisement(
          currentPassword.text, newPasswordController.text);

      loader.value = false;
    } catch (e) {
      flutterToast(e.toString());
      loader.value = false;
    }
  }
}
