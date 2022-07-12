import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/popup.dart';
import '../../utils/strings.dart';

class AccountInformationController extends GetxController {
  RxBool loader = false.obs;
  bool companySelected = false;
  File? imagePath;
  String? selectCountry;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController strintNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController comanyName = TextEditingController();
  TextEditingController companyNumber = TextEditingController();
  TextEditingController website = TextEditingController();
  bool professions = false;
  List<String> dropdownList = ["Doctor", "User", "Admin"];

  void init() {
    loader.value = true;
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) {
        loader.value = false;
      },
    );
  }

  void onCountryCoCityChange(String value) {
    selectCountry = value;
    profession.text = value;
    update(['doctor']);
  }

  selectAccount() {
    companySelected = false;
    update(['update']);
  }

  selectCompny() {
    companySelected = true;
    update(['update']);
  }

//account save
  accountSave() {
    accountValidation();
  }

  compnySave() {
    companyValidation();
  }

//account validation
  bool accountValidation() {
    if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (houseNumberController.text.isEmpty) {
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.cityeError);
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast(Strings.countryError);
      return false;
    } else if (postalCodeController.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (phoneNumberController.text.isEmpty) {
      errorToast(Strings.phoneNumber);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneNumberController.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    }
    return true;
  }

  //Company data validation
  bool companyValidation() {
    if (profession.text.isEmpty) {
      errorToast(Strings.professionError);
      return false;
    } else if (comanyName.text.isEmpty) {
      errorToast(Strings.companyNameError);
      return false;
    } else if (companyNumber.text.isEmpty) {
      errorToast(Strings.companyNumberError);
      return false;
    } else if (strintNumberController.text.isEmpty) {
      errorToast(Strings.streetError);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast(Strings.countryError);
      return false;
    } else if (postalCodeController.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (website.text.isEmpty) {
      errorToast(Strings.websiteError);
      return false;
    }
    return true;
  }

  //call Camera
  navigateToCamera() async {
    String? path = await cameraPickImage();

    if (path != null) {
      imagePath = File(path);
    }
    update(["Getpic"]);
    Get.back();
  }

  //Open Camera
  Future<String?> cameraPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(["Getpic"]);
    Get.back();

    return null;
  }

  navigateToGallary() async {
    String? path = await gallaryPickImage();

    if (path != null) {
      imagePath = File(path);
    }
  }

//open Gallary
  Future<String?> gallaryPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      update(["Getpic"]);
      Get.back();
      return pickedFile.path;
    }
    update(["Getpic"]);
    Get.back();
    return null;
  }
}
