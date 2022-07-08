import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/doctor_register/doctorRegister_screen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountry_json.dart';
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
  ListCountryModel listCountryModel = ListCountryModel();
  List<String> martialStatusList = [
    Strings.single,
    Strings.married,
  ];
  List<String> countryCity = [];
  List<String> countryId = [];

  List<String> noOfKids = ["0", "1", "2", "3", "4", "5", "6"];
  bool martialStatusDropdown = false;
  bool countryCityDropdown = false;
  bool kidsDropdown = false;
  RxBool loader = false.obs;

  void onInit() {
    countryName();
    update(['register_screen']);
    super.onInit();
  }

  void getCountry() {
    for (int i = 0; i < listCountryModel.data!.length; i++) {
      countryCity.add(listCountryModel.data![i].name!);
      countryId.add(listCountryModel.data![i].id!.toString());
    }
    update(['register_screen']);
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

  void onCountryCitySelect() {
    if (countryCityDropdown == false) {
      countryCityDropdown = true;
    } else {
      countryCityDropdown = false;
    }
    update(['register_screen']);
  }

  void onCountryCityChange(String value) {
    country.text = value;
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

  void onRegisterTap() {
    if (validation()) {
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
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (city.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    } else if (country.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (postalCode.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (phoneNumber.text.isEmpty) {
      errorToast(Strings.phoneNumber);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneNumber.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    }
    return true;
  }

  Future<void> countryName() async {
    loader.value = true;
    try {
      await ListOfCountryApi.postRegister().then((value) => listCountryModel = value!);
      getCountry();
      loader.value = false;


    } catch (e) {
      errorToast(e.toString());
      loader.value = false;
      debugPrint(e.toString());
    }
  }
}
