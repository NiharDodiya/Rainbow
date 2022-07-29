import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_api/phonenumber_api.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/VerifyPhone_json.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/verifyphone_api.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterVerifyController extends GetxController {
  TextEditingController verifyController = TextEditingController();
  RxBool loader = false.obs;
  String phoneNumber = "";
  LoginModel loginModel = LoginModel();
  int seconds = 60;
  Timer? _countDown;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

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
      await VerifyCodeApi.registerVerifyCode(verifyController.text)
          .then((value) => verifyCodeModel = value!);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> sendOtp() async {
    try {
      loader.value = true;
      await PhoneNumberApi.sendOtp(phoneNumber);

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  void phoneNumberRegister(String ph) async {
    try {
      loader.value = true;

      await PhoneNumberApi.resendOtp(ph == null
          ? PrefService.getString(PrefKeys.phonSaveNumberEndUser)
          : ph);
      /*  await PrefService.setValue(
          PrefKeys.id, phoneNumberModel.data!.id.toString());*/
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future startTimer() async {
    seconds = 60;
    update(['count_timer']);
    const oneSec = Duration(seconds: 1);
    _countDown = new Timer.periodic(
      oneSec,
      (timer) {
        if (seconds == 0) {
          _countDown!.cancel();
          timer.cancel();
          update(['count_timer']);
        } else {
          seconds--;
          update(['count_timer']);
        }
      },
    );
    update(['count_timer']);
  }
}
