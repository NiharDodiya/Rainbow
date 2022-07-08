import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/VerifyPhone_json.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/verifyphone_api.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class VerifyPhoneController extends GetxController {
  TextEditingController verifyController = TextEditingController();
RxBool loader = false.obs;
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

  Future<void> verifyCode() async {
    loader.value =true;
    List<VerifyCode> list =
        await VerifyCodeApi.postRegister(verifyController.text);

    loader.value=false;
  }
}
