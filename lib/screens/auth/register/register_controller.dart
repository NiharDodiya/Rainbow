import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterController extends GetxController {
  void init() {}

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController ethnicityController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController kidsController = TextEditingController();

  String countryCode = '+1';

  void onCountryTap() {}

  void onStatusSelect() {}

  void onEthnicitySelect() {}

  void onBODSelect() {}

  void onKidsSelect() {}

  void onAddress1Change(String str){
    if(str.length > 440 && str.length < 460){
      update(['address1']);
    }
  }

  void onAddress2Change(String str){
    if(str.length > 440 && str.length < 460){
      update(['address2']);
    }
  }

  void onRegisterTap() {
    if(validation()){

    }
  }

  void onSignInTap() {}

  bool validation() {
    if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isPassport(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (pwdController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    } else if (validatePassword(pwdController.text)) {
      errorToast(Strings.passwordValidError);
      return false;
    } else if (confirmPwdController.text.isEmpty) {
      errorToast(Strings.reTypePasswordError);
      return false;
    } else if (pwdController.text != confirmPwdController.text) {
      errorToast(Strings.reTypePasswordValidError);
      return false;
    } else if (address1Controller.text.isEmpty) {
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (phoneController.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneController.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    } else if (statusController.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (ethnicityController.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (dobController.text.isEmpty) {
      errorToast(Strings.birthDateError);
      return false;
    } else if (kidsController.text.isEmpty) {
      errorToast(Strings.noOfKidsError);
      return false;
    }
    return true;
  }
}
