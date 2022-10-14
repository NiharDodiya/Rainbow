import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/model/user_model.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/login/login_screen.dart';
import 'package:rainbow/screens/auth/register/api/register_api.dart';
import 'package:rainbow/screens/auth/register/register_json.dart';
import 'package:rainbow/service/auth_services.dart';
import 'package:rainbow/service/notification_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterController extends GetxController {
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
  String? selectedLocation;

  String? selectedEthicity;
  bool? showPassword = false;
  bool? showRetype = false;

  String? selectedNoKids;

  String? codeId;
  bool isSocial = false;

  bool countryBox = false;

  dropDownBox() {
    if (countryBox == false) {
      countryBox = true;
      update(["drop"]);
    } else {
      countryBox = false;
      update(["drop"]);
    }
    update();
  }

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

  @override
  void onInit() {
    update(['register_screen']);
    super.onInit();
  }

  void onTapShowPassword() {
    if (showPassword == false) {
      showPassword = true;

    } else {
      showPassword = false;

    }
    update(["register_form"]);
  }

  void onTapShowRetypePassword() {
    if (showRetype == false) {
      showRetype = true;

    } else {
      showRetype = false;

    }
    update(["register_form"]);
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

  void onStatusChangeCountry(String value) {

    selectedEthicity = value.toString();
    ethnicityController.text = value.toString();
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
    statusController.text = value;
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
    PrefService.setValue(PrefKeys.isLogin, false);

    if (validation()) {
      for (int i = 0; i < listNationalities.data!.length; i++) {
        if (listNationalities.data![i].name == ethnicityController.text) {
          codeId = listNationalities.data![i].id!.toString();

        }

      }

      registerDetails();
    }
  }

  List filterList = [];

  void serching(value) {
    filterList = (listNationalities.data?.where((element) {

          return element.name
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase());
        }).toList()) ??
        [];
    update(["drop"]);
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
    } else if (confirmPwdController.text.isEmpty && !isSocial) {
      errorToast(Strings.reTypePasswordError);
      return false;
    } else if (pwdController.text != confirmPwdController.text && !isSocial) {
      errorToast(Strings.reTypePasswordValidError);
      return false;
    } else if (ethnicityController.text != ethnicityController.text &&
        !isSocial) {
      errorToast("Please enter country");
      return false;
    } else if (address1Controller.text.isEmpty) {
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (phoneController.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    }
    /*else if (!GetUtils.isPhoneNumber(phoneController.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    }*/
    else if (statusController.text.isEmpty) {
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

  void onTapEthnicity(value) {
    selectedEthicity = value as String;
    ethnicityController.text = value;
    update(["register_screen"]);
  }

  var now = DateTime.now();

  void showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 400,
              color: Colors.white,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(2001),
                maximumDate: DateTime.now(),
                maximumYear: DateTime.now().year,
                onDateTimeChanged: (val) {
                  var formattedDate = "${val.month}-${val.day}-${val.year}";
                  dobController.text = formattedDate;
                  update(["register_screen"]);
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

  RegisterUserModel registerUser = RegisterUserModel();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? token;

  Future<void> registerDetails() async {
    try {
      token = await NotificationService.getFcmToken();
      loader.value = true;
      await PrefService.setValue(PrefKeys.phoneNumber,
          "+${countryModel.phoneCode + phoneController.text}");
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
              codeId.toString(),
              dobController.text,
              kidsController.text)
          .then((value) => registerUser = value);
      await PrefService.setValue(
          PrefKeys.registerToken, registerUser.token.toString());

      await LoginApi.updateDeviceToken();
      UserModel userModel = UserModel(
        name: fullNameController.text,
        email: emailController.text,
      );
      String? uid = (await AuthService.loginUser(
          userModel: userModel,
          email: emailController.text,
          pwd: pwdController.text)) as String?;
      userModel.uid = uid;
      // await UserService.createUser(userModel);
      if (uid != null) {
        await firebaseFirestore
            .collection("users")
            .doc(uid)
            .get()
            .then((value) async {
          if (value.exists) {
            await firebaseFirestore
                .collection("users")
                .doc(uid)
                .update({"online": true});
            await PrefService.setValue(PrefKeys.uid, uid);
          } else {
            await firebaseFirestore.collection("users").doc(uid).set({
              "id": registerUser.data!.id.toString(),
              "email": registerUser.data!.email.toString(),
              "uid": uid,
              "name": registerUser.data!.fullName.toString(),
              "image": registerUser.data!.profileImage.toString(),
              "UserToken": token.toString(),
              "online": true,
            });
          }
        });
      }
      loader.value = false;
      fullNameController.clear();
      emailController.clear();
      pwdController.clear();
      confirmPwdController.clear();
      address1Controller.clear();
      address2Controller.clear();

      phoneController.clear();
      statusController.clear();
    } catch (e) {
      loader.value = false;
    }
  }
}
