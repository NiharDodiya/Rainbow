import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_screen.dart';
import 'package:rainbow/utils/strings.dart';

class IdVerificationController extends GetxController {
  TextEditingController idType = TextEditingController();
  TextEditingController idNO = TextEditingController();
  bool idTypeDrop = false;
  List<String> ethnicityList = [
    Strings.single,
    Strings.married,
  ];

    void onRegisterTap() {
      if (validation()) {
        Get.to(() => const SelfieVerificationScreen());
      }
    }

  void idTypeDropDown() {
    if (idTypeDrop == false) {
      idTypeDrop = true;
    } else {
      idTypeDrop = false;
    }
    update(['register_screen']);
  }

  void idTypeVerification(String value) {
    idType.text = value;
    update(['register_screen']);
  }

  bool validation() {
    if (idType.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (idNO.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    }
    return true;
  }
}
