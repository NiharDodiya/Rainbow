import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/VerifyPhone_json.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/verifyphone_api.dart';
import 'package:rainbow/utils/strings.dart';

class VerifyPhoneController extends GetxController {
  TextEditingController verifyController = TextEditingController();
  RxBool loader = false.obs;

  bool validation() {
    if (verifyController.text.isEmpty) {
      errorToast(Strings.enterYourOtp);
      return false;
    }
    return true;
  }

  VerifyCode verifyCodeModel = VerifyCode();


  Future<void> verifyCode() async {
    try {
      loader.value = true;
      await VerifyCodeApi.postRegister(verifyController.text)
          .then((value) => verifyCodeModel = value!);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
 /* Future<void> phoneNumberRegister() async {
    try {
      loader.value = true;
      await PhoneNumberApi.postRegister(
          "+${countryModel.phoneCode + phoneNumber.text}")
          .then((value) => phoneNumberModel = value);
      await PrefService.setValue(
          PrefKeys.id, phoneNumberModel.data!.id.toString());
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }*/
}
