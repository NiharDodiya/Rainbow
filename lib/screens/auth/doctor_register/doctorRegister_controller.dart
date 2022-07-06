import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/utils/strings.dart';

class DoctorRegisterController extends GetxController
{

  TextEditingController profession =
  TextEditingController(/*text: "ravi"*/);
  TextEditingController comanyName =
  TextEditingController(/*text: "ravi@gmail.com"*/);
  TextEditingController companyNumber = TextEditingController(/*text: "Test@123"*/);
  TextEditingController confirmPwdController =
  TextEditingController(/*text: "Test@123"*/);
  TextEditingController streetName =
  TextEditingController(/*text: "csasdd"*/);
  TextEditingController city =
  TextEditingController(/*text: "dfdfwdfdw"*/);
  TextEditingController country =
  TextEditingController(/*text: "single"*/);
  TextEditingController postalCode =
  TextEditingController(/*text: "1"*/);
  TextEditingController website   =
  TextEditingController(/*text: "1"*/);

  String selectedLocation = Strings.single;

  List<String> professionList = [
    Strings.doctor,
    Strings.admin,
    Strings.endUsers,
  ];

  bool martialStatusDropdown = false;
  bool professions = false;
  bool kidsDropdown = false;
  RxBool loader = false.obs;



  void onInit() {
    update(['register_screen']);
    super.onInit();
  }



  void onStatusSelect() {
    if (martialStatusDropdown == false) {
      martialStatusDropdown = true;
    } else {
      martialStatusDropdown = false;
    }

    update(['register_screen']);
  }

  void onStatusChange(String value) {
    country.text = value;
    update(['register_screen']);
  }

  void onProfessionOnTap() {
    if (professions == false) {
      professions = true;
    } else {
      professions = false;
    }
    update(['register_screen']);
  }

  void onEthnicityChange(String value) {
    postalCode.text = value;
    update(['register_screen']);
  }

  void onBODSelect() {}

  void onKidsSelect() {
    // kidsDropdown = true;
    if (kidsDropdown == false) {
      kidsDropdown = true;
    } else {
      kidsDropdown = false;
    }
    update(['register_screen']);
  }

/*  void onKidsChange(String value) {
    kidsController.text = value;
    update(['register_screen']);
  }*/




  void onRegisterTap() {
    if (validation()) {
      Get.to(const Dashboard());

    }
  }

  void onSignInTap() {}

  bool validation() {
    if (profession.text.isEmpty) {
      errorToast(Strings.profession);
      return false;
    } else if (comanyName.text.isEmpty) {
      errorToast(Strings.companyName);
      return false;
    }else if (companyNumber.text.isEmpty) {
      errorToast(Strings.companyNumber);
      return false;
    }   else if (city.text.isEmpty) {
      errorToast(Strings.city);
      return false;
    }  else if (country.text.isEmpty) {
      errorToast(Strings.country);
      return false;
    } else if (postalCode.text.isEmpty) {
      errorToast(Strings.postalCode);
      return false;
    } else if (website.text.isEmpty) {
      errorToast(Strings.website);
      return false;
    }
    return true;
  }
}