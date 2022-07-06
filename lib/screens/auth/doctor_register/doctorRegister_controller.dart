import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/utils/strings.dart';

class DoctorRegisterController extends GetxController
{

  TextEditingController profession =
  TextEditingController(text: "Doctor");
  TextEditingController comanyName =
  TextEditingController(text: "abcd");
  TextEditingController companyNumber = TextEditingController(text: "1234");

  TextEditingController streetName =
  TextEditingController(text: "motavarachha");
  TextEditingController city =
  TextEditingController(text: "surat");
  TextEditingController country =
  TextEditingController(text: "Canada");
  TextEditingController postalCode =
  TextEditingController(text: "123125");
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
    update(['doctor']);
    super.onInit();
  }


  void onStatusChange(String value) {
    country.text = value;
    update(['doctor']);
  }

  void onProfessionOnTap() {
    if (professions == false) {
      professions = true;
    } else {
      professions = false;
    }
    update(['doctor']);
  }
  void onProfessionChange(String value) {
    profession.text = value;
    update(['register_screen']);
  }

  void onRegisterTap() {
    if (validation()) {
      Get.to(const Dashboard());

    }
  }



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