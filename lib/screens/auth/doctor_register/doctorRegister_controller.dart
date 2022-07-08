import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/doctor_register/doctor_registerApi/docotor_companyJson.dart';
import 'package:rainbow/screens/auth/doctor_register/doctor_registerApi/doctor_companyregisterApi.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/adviser_api/adviser_api.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/adviser_api/adviser_json.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountry_json.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/registeradviser_controller.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class DoctorRegisterController extends GetxController {
  TextEditingController profession = TextEditingController();
  TextEditingController comanyName = TextEditingController();
  TextEditingController companyNumber = TextEditingController();

  TextEditingController streetName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController website = TextEditingController();

  String selectedLocation = Strings.single;

  List<String> professionList = [
    Strings.doctor,
    Strings.admin,
    Strings.endUsers,
  ];
  List<String> countryCity = [];
  List<String> countryId = [];

  bool professions = false;
  bool kidsDropdown = false;
  RxBool loader = false.obs;
  bool countryCityDropdown = false;

  void onInit() {
    countryName();
    update(['doctor']);
    super.onInit();
  }

  void getCountry() {
    for (int i = 0; i < listCountryModel.data!.length; i++) {
      countryCity.add(listCountryModel.data![i].name!);
      countryId.add(listCountryModel.data![i].id!.toString());
    }
    update(['doctor']);
  }

/*  void onStatusChange(String value) {
    country.text = value;
    update(['doctor']);
  }*/
  void onCountryCoCityChange(String value) {
    country.text = value;
    update(['doctor']);
  }
  void onCountryCoCitySelect() {
    if (countryCityDropdown == false) {
      countryCityDropdown = true;
    } else {
      countryCityDropdown = false;
    }
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
    update(['doctor']);
  }

  Future<void> onRegisterTap() async {
    if (validation()) {
      companyRegister();
    }
  }
  ListCountryModel listCountryModel = ListCountryModel();
  Future<void> countryName() async {
    loader.value = true;
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      getCountry();
      loader.value = false;
    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  bool validation() {
    if (profession.text.isEmpty) {
      errorToast(Strings.profession);
      return false;
    } else if (comanyName.text.isEmpty) {
      errorToast(Strings.companyName);
      return false;
    } else if (companyNumber.text.isEmpty) {
      errorToast(Strings.companyNumber);
      return false;
    } else if (city.text.isEmpty) {
      errorToast(Strings.city);
      return false;
    } else if (country.text.isEmpty) {
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

  AdviserRegisterController controller = Get.put(AdviserRegisterController());

  AdvertiserRegister advertiserRegister = AdvertiserRegister();

  Future<void> companyRegister() async {
    loader.value = true;
    try {
      await AdvirtisersApi.postRegister(
              controller.fullNameController.text,
              controller.emailController.text,
              controller.pwdController.text,
              controller.houseNumber.text,
              controller.streetName.text,
              "+${controller.countryModel.phoneCode + controller.phoneNumber.text}",
              controller.city.text,
              controller.country.text,
              controller.postalCode.text,
              profession.text,
              comanyName.text,
              companyNumber.text,
              streetName.text,
              city.text,
              country.text,
              postalCode.text,
              website.text)
          .then(
        (value) => advertiserRegister = value!,
      );
      loader.value = false;
    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
