import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
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
  String? selectedId;
  RxBool loader = false.obs;

  @override
  void onInit() {
    super.onInit();
    update(["IdVerification_screen"]);
  }



  List<String> idTypeList = [
    Strings.passport,
    "Passport",
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
/*  void onStatusChange(String  value) {
    print(value);
    selectedId = value.toString();
    idType.text = value.toString();
    update(['IdVerification_screen']);
  }*/
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

  IdVerification idVerificationList = IdVerification();

  Future<void> idVerification() async {
    loader.value = true;
    try {await IdVerificationApi.postRegister(
          idType.text, idNO.text, uploadImage1.data!.id.toString(),
          uploadImage2.data!.id.toString()).then((value) => idVerificationList= value);
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  UploadImage uploadImage1 = UploadImage();
  UploadImage uploadImage2 = UploadImage();


  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(imageFront.toString()
      ).then((value) => uploadImage1 = value!,
      );
      loader.value = false;
    } catch (e) {

      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> uploadImageBackApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(imageBack.toString()
      ).then((value) => uploadImage2 = value!,
      );
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
