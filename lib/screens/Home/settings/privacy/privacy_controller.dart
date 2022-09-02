import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/privacy_model.dart';
import 'package:rainbow/screens/Home/settings/privacy/privacy_api/privacy_api.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';

class PrivacyController extends GetxController {
  RxBool loader = false.obs;

  List<String> privacyList = [
    "Display Photo",
    "Basic Information",
    "Social Media",
    "About Me",
    "Hobbies and Interest",
    "Testimonials",
    "Visitors"
  ];
  List<bool> isChecked = [];
  ProfileController profileController = Get.put(ProfileController());

  void onInit() {
    isChecked = List.filled(privacyList.length, false);
    update(["check"]);
  }

  void init() {
    setInitData();
  }

  setInitData() {
    isChecked[0] = profileController.viewProfile.data!.profilePhoto ?? false;
    isChecked[1] = profileController.viewProfile.data!.basicInfo ?? false;
    isChecked[2] = profileController.viewProfile.data!.socialMedia ?? false;
    isChecked[3] = profileController.viewProfile.data!.aboutMe ?? false;
    isChecked[4] = profileController.viewProfile.data!.hobbiesInterest ?? false;
    // isChecked[5] = profileController.viewProfile.data!.testimonials ?? false;
    isChecked[6] = profileController.viewProfile.data!.visitors ?? false;
  }

  PrivacyModel privacyModel = PrivacyModel();

  Future<void> privacyDetails() async {
    loader.value = true;
    try {
      privacyModel = await PrivacyApi.postRegister(
        isChecked[0],
        isChecked[1],
        isChecked[2],
        isChecked[3],
        isChecked[4],
        isChecked[5],
        isChecked[6],
      );
      await profileController.viewProfileDetails();
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  void onSaveTap() {
    privacyDetails();
  }

  void onCheckMarkChange(bool? value, int index) {
    /*if(index == 0){
      displayPhoto = value;
    }else if(index == 1){
      basicInformation = value;
    }else if(index == 2){
      socialMeadiam = value;
    }else if(index == 3){
      aboutMe = value;
    }else if(index == 4){
      hobbiesAndInterest = value;
    }else if(index == 5){
      testimonials = value;
    }else if(index == 6){
      visitors = value;
    }*/

    isChecked[index] = value ?? false;
    update(["check"]);
  }

  checkBoxText({required bool check}) {
    if (check == true) {
      check = false;
    } else {
      check = true;
    }
    update(['check']);
  }
}
