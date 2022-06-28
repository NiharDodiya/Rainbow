import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/utils/strings.dart';

class CompleteYourProfileController extends GetxController {
  TextEditingController bio = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController faceBook = TextEditingController();
  TextEditingController youTube = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController aboutMe = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  String aboutTextCounter = '';
  String hobbiesTextCounter = '';
  List lbsList = ["181", "182", "183", "184", "185", "186", "187"];

  void onInit() {
    update(['Complete_screen']);
    super.onInit();
  }

  void onRegisterTap() {
    if (validation()) {}
  }

  bool validation() {
    if (bio.text.isEmpty) {
      errorToast(Strings.bioError);
      return false;
    } else if (height.text.isEmpty) {
      errorToast(Strings.height);
      return false;
    } else if (weight.text.isEmpty) {
      errorToast(Strings.height);
      return false;
    } else if (status.text.isEmpty) {
      errorToast(Strings.statusError);
      return false;
    } else if (instagram.text.isEmpty) {
      errorToast(Strings.instagram);
      return false;
    } else if (faceBook.text.isEmpty) {
      errorToast(Strings.faceBookError);
      return false;
    } else if (youTube.text.isEmpty) {
      errorToast(Strings.youtubeError);
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
}
