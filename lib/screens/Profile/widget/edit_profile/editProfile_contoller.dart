import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_api.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_model.dart';
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

  String? selectedEthicity;
  File? frontImage;
  File? backImage;
  RxBool loader = false.obs;
  String? heightData;
  String? weightData;
  int heightFeet = 0;
  int heightInches = 0;

  String? codeId;
  ProfileController profileController = Get.put(ProfileController());

  void onInit() {
    update(['Edit_profile']);
    super.onInit();
  }

  Future<void> onTapTextField() async {
    if (validation()) {
      for (int i = 0; i < listNationalities.data!.length; i++) {
        if (listNationalities.data![i].name == ethnicity.text) {
          codeId = listNationalities.data![i].id!.toString();
          print(codeId);
        }

        print(codeId);
      }

      await editProfileApi();
      await profileController.viewProfileDetails();
      // Get.back();
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
    final imageFront = File(image.path);
    frontImage = imageFront;
    uploadImageApi();

    update(["Edit_profile"]);

  }

  Future backCamera() async {

    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    backImage = imageTemp;
    uploadImageBackApi();
    update(["Edit_profile"]);


  }

  UploadImage uploadImage1 = UploadImage();
  UploadImage uploadImage2 = UploadImage();

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(frontImage!.path.toString()).then(
        (value) => uploadImage1 = value!,
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
      await UploadImageApi.postRegister(backImage!.path.toString()).then(
        (value) => uploadImage2 = value!,
      );

      loader.value = false;
    } catch (e) {

      loader.value = false;
      debugPrint(e.toString());
    }
  }

  EditProfile editProfile = Get.put(EditProfile());

  Future<void> editProfileApi() async {
    loader.value = true;
    try {
      await EditProfileApi.postRegister(
        uploadImage1.data!.id.toString(),
        uploadImage2.data!.id.toString(),
        fullName.text,
        status.text,
        height.text,
        city.text,
        age.text,
        weight.text,
        codeId.toString(),
        status1.text,
        instagram.text,
        youTube.text,
        faceBook.text,
        twitter.text,
        aboutMe.text,
        hobbies.text,
        haveKids.text,
      ).then((value) => editProfile = value);
      loader.value = false;


    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  void onHeightSave(){
    height.text = "$heightFeet'$heightInches";
    update(["Edit_profile"]);
    Get.back();
  }
   void onWeightSave(){
    weight.text = "${weightData}lbs";
    update(["Edit_profile"]);
    Get.back();
  }

}
