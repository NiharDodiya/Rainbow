import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/utils/strings.dart';

class VerifyPhoneController extends GetxController {
  TextEditingController verifyController = TextEditingController();

  bool validation() {
    if (verifyController.text.isEmpty) {
      errorToast(Strings.enterYourOtp);
      return false;
    } else if (verifyController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    }
    return true;
  }
}
