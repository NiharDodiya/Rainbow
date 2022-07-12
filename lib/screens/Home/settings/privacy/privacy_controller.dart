import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/privacy_model.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_api/privacy_api.dart';
import 'package:rainbow/screens/Profile/widget/profile_details.dart';

class PrivacyController extends GetxController {
  bool displayPhoto = true;
  bool basicInformation = false;
  bool socialMeadiam = false;
  bool aboutMe = false;
  bool hobbiesAndInterest = false;
  bool testimonials = false;
  bool visitors = false;
  RxBool loader = false.obs;

    List<String> privacyList = [
    "DisplayPhoto",
    "BasicInformation",
    "SocialMeadiam",
    "AboutMe",
    "HobbiesAndInterest",
    "Testimonials",
    "Visitors"
  ];
  List<bool>? isChecked;
  void onInit()
  {
    isChecked = List.filled(privacyList.length, false);
    update(["check"]);
  }

  PrivacyModel privacyModel = PrivacyModel();
  Future<void> privacyDetails() async {
    loader.value = true;
    try {
      await PrivacyApi.postRegister(
              displayPhoto,
              basicInformation,
              socialMeadiam,
              aboutMe,
              hobbiesAndInterest,
              testimonials,
              visitors)
          .then((value) => privacyModel = value);
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  void onSaveTap(){
    privacyDetails();
  }
}
