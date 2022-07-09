import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/auth/login/login_screen.dart';
import 'package:rainbow/screens/auth/register/api/register_api.dart';
import 'package:rainbow/screens/auth/register/register_json.dart';
import 'package:rainbow/screens/getstarted_screen.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterController extends GetxController {
  void init() {}
  DateTime selectedDate = DateTime.now();
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
  bool isSocial = false;
  String? selectedLocation;

  String? selectedEthicity;

  String? selectedNoKids;

  String socialId = "";
  List<String> martialStatusList = [
    Strings.single,
    Strings.married,
  ];
  List<String> ethnicityList = [
    "0",
    "1",
    "2",
  ];
  List<String> noOfKids = ["0", "1", "2", "3", "4", "5", "6"];
  bool martialStatusDropdown = false;
  bool ethnicityDropdown = false;
  bool kidsDropdown = false;
  RxBool loader = false.obs;

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

  void onInit() {
    update(['register_screen']);
    super.onInit();
  }

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

  void onStatusSelect() {
    if (martialStatusDropdown == false) {
      martialStatusDropdown = true;
    } else {
      martialStatusDropdown = false;
    }

    update(['register_screen']);
  }

  void onStatusChange(String value) {
    statusController.text = value;
    update(['register_screen']);
  }

  void onEthnicitySelect() {
    if (ethnicityDropdown == false) {
      ethnicityDropdown = true;
    } else {
      ethnicityDropdown = false;
    }
    update(['register_screen']);
  }

  void onEthnicityChange(String value) {
    ethnicityController.text = value;
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

  void onKidsChange(String value) {
    kidsController.text = value;
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
      registerDetails();
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
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (pwdController.text.isEmpty && !isSocial) {
      errorToast(Strings.passwordError);
      return false;
    } else if (validatePassword(pwdController.text) == false && !isSocial) {
      errorToast(Strings.confirmShortPassword);
      return false;
    } else if (confirmPwdController.text.isEmpty&& !isSocial) {
      errorToast(Strings.reTypePasswordError);
      return false;
    } else if (pwdController.text != confirmPwdController.text && !isSocial) {
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

  void showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(2001),
                maximumDate: DateTime.now(),
                maximumYear: DateTime.now().year,
                onDateTimeChanged: (val) {
                  var formattedDate = "${val.day}-${val.month}-${val.year}";
                  dobController.text = formattedDate;
                },
              ),
            ),

            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            )
          ],
        ),
      ),
    );
  }

  void onLoginTap() {
    Get.off(() => LoginScreen(), transition: Transition.cupertino);
  }

  RegisterUser registerUser = RegisterUser();

  Future<void> registerDetails() async {
    try {
      loader.value = true;
      await RegisterApi.postRegister(
              fullNameController.text,
              emailController.text,
              socialId,
              pwdController.text,
              confirmPwdController.text,
              address1Controller.text,
              address2Controller.text,
              "+${countryModel.phoneCode + phoneController.text}",
              statusController.text,
              ethnicityController.text,
              dobController.text,
              kidsController.text)
          .then((value) => registerUser = value);
      await PrefService.setValue(PrefKeys.registerToken, registerUser.token.toString());

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
}
