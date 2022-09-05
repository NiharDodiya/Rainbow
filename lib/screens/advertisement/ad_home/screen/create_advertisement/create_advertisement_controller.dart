import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/advertisement_deatail/advertisement_deatail_screen.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/create_advertisement/createadvertisement_api/createAdvertisement_api.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/setup_date/setup_date_screen.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';

import '../../../../../common/popup.dart';
import '../../../../../utils/strings.dart';

class CreateAdvertisementController extends GetxController {
  List tags = [];
  String? callToAction;
  String? address;
  String? addCountry;
  String? addCity;
  String? addStreet;
  TextEditingController tagsController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptoionController = TextEditingController();
  TextEditingController urlLinkController = TextEditingController();
  TextEditingController callToActionController = TextEditingController();
  List<String> dropDList = ["Learn More", "Contact Us"];

  DateTime? startTime = DateTime.now();
  DateTime selectableDate = DateTime.now();
  DateTime? endTime = DateTime.now();
  String flag = AssetRes.flag01;
  bool showDropDown = false;
  List<String> flagList = [AssetRes.flag01, AssetRes.flag02];
  List<String> list = ["Caneda", "India"];
  String currency = "\$";
  List<String> currencyList = ["\$", "₹"];
  String select = 'Caneda';

  int pageIndex = 0;

  TextEditingController amountController =
      TextEditingController(text: "\$200.00");

  // File? imagePath;
  List<File> imagePath = [];
  RxBool loader = false.obs;

  String? selectedCity;

  void onTapEthnicity(value) {
    selectedCity = value as String;
    countryController.text = value;
    update(["advertiser"]);
  }

  tagsListSet() {
    if (!tagsController.text.toString().contains(",")) {
      tags.add(tagsController.text.toString());
    } else {
      // String addcomma = "${tagsController.text},";
      tags = tagsController.text.split(',');
      tags.removeWhere((e) => e.isEmpty);
    }
  }

  /// On Tap Dropdown
  void onCallToActionChange(String value) {
    callToAction = value;
    callToActionController.text = value;
    update(['advertiser']);
  }

  //call Camera
  navigateToCamera() async {
    String? path = await cameraPickImage();

    if (path != null) {
      imagePath.add(File(path));
    }
    update(["advertiser"]);

    Get.back();
  }

  //Open Camera
  Future<String?> cameraPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.add(File(pickedFile.path));
    }
    update(["advertiser"]);

    return null;
  }

  navigateToGallary() async {
    String? path = await gallaryPickImage();

    if (path != null) {
      imagePath.add(File(path));
    }
  }

//open Gallary
  Future<String?> gallaryPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      update(["advertiser"]);

      imagePath.add(File(pickedFile.path));
    }
    update(["advertiser"]);
    Get.back();
    return null;
  }

  UploadImage uploadImage = UploadImage();

  Future<void> uploadImageApi() async {
    try {
      imgIdList = [];
      for (var e in imagePath) {
        loader.value = true;
        uploadImage = await UploadImageApi.postRegister(e.path);
        imgIdList.add(uploadImage.data!.id!);
      }
      addAdvertisement(imgIdList);
      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int? codeId;

  createAdvertisement() {
    tagsListSet();
    if (validation()) {
      for (int i = 0; i < listCountryModel.data!.length; i++) {
        if (listCountryModel.data![i].name == countryController.text) {
          codeId = listCountryModel.data![i].id;
        }
      }
      /*uploadImageApi();*/
      Get.to(() => AdvertisementDeatailScreen());
    }
  }

  bool validation() {
    if (tagsController.text.isEmpty) {
      errorToast(Strings.tagsError);
      return false;
    } else if (imagePath == null) {
      errorToast(Strings.imageError);
      return false;
    } else if (titleController.text.isEmpty) {
      errorToast(Strings.titleError);
      return false;
    } else if (countryController.text.isEmpty) {
      errorToast(Strings.canedaError);
      return false;
    } else if (streetController.text.isEmpty) {
      errorToast(Strings.streetError);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (provinceController.text.isEmpty) {
      errorToast(Strings.provinceError);
      return false;
    } else if (postalCodeController.text.isEmpty) {
      errorToast(Strings.postalCodeError);
      return false;
    } else if (dateController.text.isEmpty) {
      errorToast(Strings.date);
      return false;
    } else if (descriptoionController.text.isEmpty) {
      errorToast(Strings.descriptionError);
      return false;
    } else if (callToAction == null) {
      errorToast(Strings.callActionError);
      return false;
    } else if (hasValidUrl(urlLinkController.text) == false) {
      errorToast(Strings.websiteError);
      return false;
    }
    return true;
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    loader.value = true;
    if (permission == LocationPermission.denied) {
      LocationPermission result = await Geolocator.requestPermission();
      return (result == LocationPermission.always ||
          result == LocationPermission.whileInUse);
    } else {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      addCity = place.locality;
      addCountry = place.country;
      addStreet = place.street;
      address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$address>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      update(["advertiser"]);
    }
    loader.value = false;
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
                  dateController.text = formattedDate;
                  update(["advertiser"]);
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

  List<UserData> tagUserList = [];
  List<UserData> filterList = [];

/*
  void onTagTap(UserData userData) {
    tagUserList.add(userData);
    String sent = tagsController.text;

    List<String> list = sent.split(' ');

    list.removeLast();

    tagsController.text =
        "${list.join(' ')}${list.isEmpty ? '' : ' '}@${userData.fullName}";
    filterList = [];
    update(['createStory']);
    tagsController.selection =
        TextSelection.collapsed(offset: tagsController.text.length);
  }
*/

  List<int> imgIdList = [];
  AdHomeController adHomeController = Get.put(AdHomeController());

  void addAdvertisement(List imageId) async {
    loader.value = true;

    await AddAdvertisement.addAdvertisementApi(
        tagUser: tags,
        idItem: imageId,
        title: titleController.text,
        callAction: callToActionController.text,
        city: cityController.text,
        date: dateController.text,
        description: descriptoionController.text,
        postalCode: postalCodeController.text,
        location: address.toString(),
        province: provinceController.text,
        street: streetController.text,
        urlLink: urlLinkController.text,
        countryCode: codeId.toString(),
        startDate: DateFormat().add_yMd().format(startTime!),
        endDate: DateFormat().add_yMd().format(endTime!));
    adHomeController.myAdvertiserListData();
    adHomeController.update(['more']);
    loader.value = false;
    update(["advertiser"]);
  }

  rangSelect(start, end, range) {
    startTime = start;
    endTime = end;
    update(['range']);
  }

  showDrop() {
    showDropDown = true;
    update(['selectC']);
  }

  selectContry(index) {
    showDropDown = false;
    select = list[index];
    flag = flagList[index];
    currency = currencyList[index];
    update(['selectC']);
  }

  drop(val) {
    select = val;
    update(['drop']);
  }

  void onCountryTap(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (country) {
        // countryModel = country;
        select = country.toString();
        update(['Phone']);
      },
    );
  }

  bool validation1() {
    if (startTime.toString().isEmpty) {
      errorToast("please select date");
      return false;
    } else if (endTime.toString().isEmpty) {
      errorToast("please select date");
      return false;
    } else if (currency.isEmpty) {
      errorToast("please enter your amount");
    }
    return true;
  }

/*  CreateAdvertisementController createAdvertisementController =Get.put(CreateAdvertisementController());*/
  Future<void> onTapNext() async {
    if (validation()) {
/*      print(DateFormat().add_yMd().format(startTime));*/
/*    await  createAdvertisementController.uploadImageApi();*/

      print(tagsController.text);
      Get.bottomSheet(
        enableDrag: false,
        BottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          backgroundColor: ColorRes.white,
          onClosing: () {},
          constraints: BoxConstraints(
            maxHeight: Get.height - (Get.height * 0.2),
          ),

          // enableDrag: true,
          builder: (_) => ShowBottomNext(
            amount: currency,
          ),
        ),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        ignoreSafeArea: true,
      );
      await uploadImageApi();
/*      boostAdvertisementApi();*/
    }
  }
}
