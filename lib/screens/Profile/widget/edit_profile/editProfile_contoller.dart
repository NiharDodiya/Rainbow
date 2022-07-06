import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/utils/strings.dart';

class EditProfileController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController ethnicity = TextEditingController();
  TextEditingController haveKids = TextEditingController();
  TextEditingController status1 = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController youTube = TextEditingController();
  TextEditingController faceBook = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController aboutMe = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  String aboutTextCounter = '';
  String hobbiesTextCounter = '';
  File? frontImage;
  File? backImage;
  void onInit() {
    update(['Edit_profile']);
    super.onInit();
  }

  void onTapTextField() {
    if (validation()) {
      Get.back();
    }
  }

  bool validation() {
    if (fullName.text.isEmpty) {
      errorToast(Strings.fullName);
      return false;
    } else if (status.text.isEmpty) {
      errorToast(Strings.status);
      return false;
    } else if (age.text.isEmpty) {
      errorToast(Strings.age);
      return false;
    } else if (city.text.isEmpty) {
      errorToast(Strings.city);
      return false;
    } else if (height.text.isEmpty) {
      errorToast(Strings.height);
      return false;
    } else if (weight.text.isEmpty) {
      errorToast(Strings.weight);
      return false;
    } else if (ethnicity.text.isEmpty) {
      errorToast(Strings.ethnicity);
      return false;
    } else if (haveKids.text.isEmpty) {
      errorToast(Strings.haveKids);
      return false;
    } else if (status1.text.isEmpty) {
      errorToast(Strings.status);
      return false;
    } else if (instagram.text.isEmpty) {
      errorToast(Strings.instagram);
      return false;
    } else if (youTube.text.isEmpty) {
      errorToast(Strings.youTube);
      return false;
    } else if (faceBook.text.isEmpty) {
      errorToast(Strings.faceBook);
      return false;
    } else if (twitter.text.isEmpty) {
      errorToast(Strings.twitter);
      return false;
    } else if (aboutMe.text.isEmpty) {
      errorToast(Strings.aboutMe);
      return false;
    } else if (hobbies.text.isEmpty) {
      errorToast(Strings.hobbies);
      return false;
    }
    return true;
  }

  Future frontCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;
    final imageTemp = File(image.path);
    frontImage = imageTemp;
    update(["Edit_profile"]);
  }

  Future backCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    backImage = imageTemp;
    update(["Edit_profile"]);
  }
}
