import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/account_Information/ad_information_api/ad_information_api.dart';
import 'package:rainbow/screens/account_Information/ad_information_api/ad_information_model.dart';
import '../../common/popup.dart';
import '../../utils/strings.dart';

class AccountInformationController extends GetxController {
  RxBool loader = false.obs;
  bool companySelected = false;
  File? imagePath;
  String? selectCountry;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController companyStreetNumberController = TextEditingController();
  TextEditingController streetNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController companyCityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController companyCountryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController companyPostalCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyNumber = TextEditingController();
  TextEditingController website = TextEditingController();
  bool professions = false;
  List<String> dropdownList = ["Doctor", "User", "Admin"];
  AdInformationModel adViewProfile = AdInformationModel();
  UploadImage uploadImage = UploadImage();
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

  Future<void> init() async {
    loader.value = true;
    await AdInformationAPI.adProfileView().then((value) {
      adViewProfile = value;
      print(value);
      fullNameController.text = adViewProfile.data!.fullName!;
      emailController.text = adViewProfile.data!.email!;
      houseNumberController.text = adViewProfile.data!.houseNumber!;
      streetNumberController.text = adViewProfile.data!.streetName!;
      cityController.text = adViewProfile.data!.city!;
      countryController.text = adViewProfile.data!.country!;
      postalCodeController.text = adViewProfile.data!.postalCode!.toString();
      phoneNumberController.text = adViewProfile.data!.phoneNumber!.split(' ').last;
      postalCodeController.text = adViewProfile.data!.postalCode! as String;
      phoneNumberController.text = adViewProfile.data!.phoneNumber!;
      selectCountry = adViewProfile.data!.profession!;
      companyName.text = adViewProfile.data!.companyName!;
      companyNumber.text = adViewProfile.data!.companyPhoneNumber!;
      companyStreetNumberController.text =
          adViewProfile.data!.compnayStreetName!;
      companyCityController.text = adViewProfile.data!.compnayCity!;
      companyCountryController.text = adViewProfile.data!.companyCountry!;
      companyPostalCodeController.text =
          adViewProfile.data!.compnayPostalCode!.toString();
      website.text = adViewProfile.data!.compnayWebsite!;
      loader.value = false;
      countryModel = CountryParser.parseCountryCode(adViewProfile.data!.phoneNumber!.split(' ').first);
      update(['doctor']);
      update(['update']);
      update(['Getpic']);

    });
  }

  void onCountryCoCityChange(String value) {
    selectCountry = value;
    profession.text = value;
    update(['doctor']);
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

  compnySave() {
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

  //Company data validation
  bool companyValidation() {
    if (profession.text.isEmpty) {
      errorToast(Strings.professionError);
      return false;
    } else if (companyName.text.isEmpty) {
      errorToast(Strings.companyNameError);
      return false;
    } else if (companyNumber.text.isEmpty) {
      errorToast(Strings.companyNumberError);
      return false;
    } else if (companyStreetNumberController.text.isEmpty) {
      errorToast(Strings.streetError);
      return false;
    } else if (companyCityController.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (companyCountryController.text.isEmpty) {
      errorToast(Strings.countryError);
      return false;
    } else if (companyPostalCodeController.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (website.text.isEmpty) {
      errorToast(Strings.websiteError);
      return false;
    }
    return true;
  }

  //call Camera
  navigateToCamera() async {
    String? path = await cameraPickImage();

    if (path != null) {
      imagePath = File(path);
    }
    update(["Getpic"]);
    Get.back();
  }

  //Open Camera
  Future<String?> cameraPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(["Getpic"]);
    Get.back();

    return null;
  }

  navigateToGallary() async {
    String? path = await gallaryPickImage();

    if (path != null) {
      imagePath = File(path);
    }
  }

//open Gallary
  Future<String?> gallaryPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      update(["Getpic"]);
      Get.back();
      return pickedFile.path;
    }
    update(["Getpic"]);
    Get.back();
    return null;
  }

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(imagePath!.path.toString()).then(
            (value) => uploadImage = value!,
      );

      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }


  Future<void> onTapSave() async {
    loader.value = true;


    Map<String, Map<String, dynamic>> param1 = {
      "advirtisersData": {
        "id_item_profile": uploadImage.data!.id,
        "full_name": fullNameController.text,
        "email": emailController.text,
        "house_number":houseNumberController.text,
        "street_name": streetNumberController.text,
        "phone_number": phoneNumberController.text,
        "city": cityController.text,
        "id_country": 1,
        "postal_code": 9376432
      },
      "companyData": {
        "profession": "Doctor",
        "company_name": "Google",
        "company_phone_number": "+91 364098472532",
        "street_name": "vip Road",
        "city": "Delhi",
        "id_country": 1,
        "postal_code": 735522,
        "website": "google.com"
      }
    };

    await AdInformationAPI.adProfileEdit(param1).then(
      (value) {
        adViewProfile = value;
        print(value);
        fullNameController.text = adViewProfile.data!.fullName!;
        emailController.text = adViewProfile.data!.email!;
        houseNumberController.text = adViewProfile.data!.houseNumber!;
        streetNumberController.text = adViewProfile.data!.streetName!;
        cityController.text = adViewProfile.data!.city!;
        countryController.text = adViewProfile.data!.country!;
        postalCodeController.text = adViewProfile.data!.postalCode!.toString();
        phoneNumberController.text = adViewProfile.data!.phoneNumber!;

        selectCountry = adViewProfile.data!.profession!;
        companyName.text = adViewProfile.data!.companyName!;
        companyNumber.text = adViewProfile.data!.companyPhoneNumber!;
        companyStreetNumberController.text =
        adViewProfile.data!.compnayStreetName!;
        companyCityController.text = adViewProfile.data!.compnayCity!;
        companyCountryController.text = adViewProfile.data!.companyCountry!;
        companyPostalCodeController.text =
            adViewProfile.data!.compnayPostalCode!.toString();
        website.text = adViewProfile.data!.compnayWebsite!;
        update(['doctor']);
        update(['update']);
        update(['Getpic']);
        loader.value = false;
      },
    );
  }
}
