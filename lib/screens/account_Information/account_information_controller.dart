import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/popup.dart';
import '../../utils/strings.dart';

class AccountInformationController extends GetxController {
  bool companySelected = false;
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
  
  bool professions =false;


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
  
  void onProfessionOnTap() {
    if (professions == false) {
      professions = true;
    } else {
      professions = false;
    }
    // update(['doctor']);
  }
 
 compnySave(){
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
  
  bool companyValidation() {
 if (profession.text.isEmpty) {
      errorToast(Strings.professionError);
      return false;
    } else if (comanyName.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (strintNumberController.text.isEmpty) {
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (postalCodeController.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (website.text.isEmpty) {
      errorToast(Strings.phoneNumber);
      return false;
    } 
    return true;
  }
}
