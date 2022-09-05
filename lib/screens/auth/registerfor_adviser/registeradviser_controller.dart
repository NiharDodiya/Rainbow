import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_screen.dart';
import 'package:rainbow/utils/strings.dart';

class AdviserRegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController phoneNumber =
      TextEditingController(/*text: "07-06-1999"*/);
  String selectedLocation = Strings.single;
  String? selectedValue;

  bool? showPassword = false;
  bool? showRetype = false;

  //ListCountryModel listCountryModel = ListCountryModel();
  List<String> martialStatusList = [
    Strings.single,
    Strings.married,
  ];

  List<String> noOfKids = ["0", "1", "2", "3", "4", "5", "6"];
  bool martialStatusDropdown = false;
  bool countryCityDropdown = false;
  bool kidsDropdown = false;
  RxBool loader = false.obs;

  void onInit() {
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
    print(value);
    selectedValue = value.toString();
    country.text = value.toString();
    update(['country']);
    print(selectedValue);
    print(countryCity);
  }

  void onCountryCitySelect() {
    if (countryCityDropdown == false) {
      countryCityDropdown = true;
    } else {
      countryCityDropdown = false;
    }
    update(['register_screen']);
  }

  void onTapShowPassword() {
    if (showPassword == false) {
      showPassword = true;
      print(showPassword);
    } else {
      showPassword = false;
      print(showPassword);
    }
    update(["register_form"]);
  }

  void onTapShowRetypePassword() {
    if (showRetype == false) {
      showRetype = true;
      print(showRetype);
    } else {
      showRetype = false;
      print(showRetype);
    }
    update(["register_form"]);
  }

/*  void onCountryCityChange(String value) {
    country.text = value;
    selectedValue = value;
    update(['country']);
  }*/

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

  void onAddress1Change(String str) {
    if (str.length > 440 && str.length < 460) {
      update(['address1']);
    }
  }

  void onAddress2Change(String str) {
    if (str.length > 440 && str.length < 460) {
      update(['address2']);
    }
  }

  String? passId;

  void onRegisterTap() {
    if (validation()) {
      for (int i = 0; i < listCountryModel.data!.length; i++) {
        if (listCountryModel.data![i].name == country.text) {
          passId = listCountryModel.data![i].id!.toString();
          print(passId);
        }
      }

      Get.to(() => DoctorRegisterScreen());
    }
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
        update(['phone_filed']);
      },
    );
  }

  void onSignInTap() {}

  bool validation() {
    if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (pwdController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    } else if (validatePassword(pwdController.text) == false) {
      errorToast(Strings.passwordValidError);
      return false;
    } else if (confirmPwdController.text.isEmpty) {
      errorToast(Strings.reTypePasswordError);
      return false;
    } else if (pwdController.text != confirmPwdController.text) {
      errorToast(Strings.reTypePasswordValidError);
      return false;
    } else if (houseNumber.text.isEmpty) {
      errorToast(Strings.houseNumberError);
      return false;
    } else if (city.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (streetName.text.isEmpty) {
      errorToast(Strings.streetError);
      return false;
    } else if (country.text.isEmpty) {
      errorToast(Strings.countryError);
      return false;
    } else if (postalCode.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (phoneNumber.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    }
    /* else if (!GetUtils.isPhoneNumber(phoneNumber.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    }*/
    return true;
  }

// Future<void> countryName() async {
//   loader.value = true;
//   try {
//     await ListOfCountryApi.postRegister().then((value) => listCountryModel = value!);
//     getCountry();
//     loader.value = false;
//
//   } catch (e) {
//     errorToast(e.toString());
//     loader.value = false;
//     debugPrint(e.toString());
//   }
// }
}
