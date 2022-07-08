import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/idVerification/idVerification_api/idVerification_api.dart';
import 'package:rainbow/screens/idVerification/idVerification_api/idVerification_json.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_screen.dart';
import 'package:rainbow/utils/strings.dart';

class IdVerificationController extends GetxController {
  TextEditingController idType = TextEditingController(/*text: "single"*/);
  TextEditingController idNO = TextEditingController(/*text: "13445"*/);
  bool idTypeDrop = false;
  String? imageFront;
  String? imageBack;
  RxBool loader = false.obs;

  @override
  void onInit() {
    super.onInit();
    update(["IdVerification_screen"]);
  }

  List<String> ethnicityList = [
    Strings.passport,
    Strings.passport,
  ];

  void onRegisterTap() {
    if (validation() && imageBack != null && imageFront != null) {
      idVerification();
    }
  }

  void idTypeDropDown() {
    if (idTypeDrop == false) {
      idTypeDrop = true;
    } else {
      idTypeDrop = false;
    }
    update(['IdVerification_screen']);
  }

  void idTypeVerification(String value) {
    idType.text = value;
    update(['IdVerification_screen']);
  }

  bool validation() {
    if (idType.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (idNO.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (imageFront == null) {
      errorToast(Strings.imageFrontError);
      return false;
    } else if (imageBack == null) {
      errorToast(Strings.imageBackError);
      return false;
    }
    return true;
  }

  Future<void> idVerification() async {
    loader.value = true;
    try {
      List<IdVerification> list = await IdVerificationApi.postRegister(
          idType.text, idNO.text, imageFront.toString(), imageBack.toString());
      loader.value = false;
      if (list.isNotEmpty) {
        Get.to(() => const SelfieVerificationScreen());
      }
    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
