import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_api/phonenumber_api.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_api/phonenumber_json.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class PhoneNumberController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  RxBool loader = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool validation() {
    if (phoneNumber.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    } /*else if (GetUtils.isPhoneNumber(phoneNumber.text)) {
      errorToast(Strings.phoneNumberValidError);
    }*/
    return true;
  }

  Country countryModel = Country.from(json: {
    "e164_cc": "1",
    "iso2_cc": "CA",
    "e164_sc": 0,
    "geographic": true,
    "level": 2,
    "name": "Canada",
    "example": "2042345678",
    "display_name": "Canada (CA) [+1]",
    "full_example_with_plus_sign": "+12042345678",
    "display_name_no_e164_cc": "Canada (CA)",
    "e164_key": "1-CA-0"
  });

  void onCountryTap(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryModel = country;
        update(['Phone']);
      },
    );
  }

  void onRegisterTap() {
    if (validation()) {
      phoneNumberRegister();
    }
  }
  PhoneNumber phoneNumberModel =Get.put(PhoneNumber());
  Future<void> phoneNumberRegister() async {
    try {
      loader.value=true;

          await PhoneNumberApi.postRegister( "+${countryModel.phoneCode+phoneNumber.text}").then((value) => phoneNumberModel=value);
      await PrefService.setValue(PrefKeys.id, phoneNumberModel.data!.id.toString());
      loader.value=false;
    } catch (e) {
      loader.value=false;

    }
  }
}
