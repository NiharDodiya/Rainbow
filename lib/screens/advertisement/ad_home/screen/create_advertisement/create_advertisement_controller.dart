import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/advertisement_deatail/advertisement_deatail_screen.dart';

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
  TextEditingController canedaController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController preovinceController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptoionController = TextEditingController();
  TextEditingController urlLinkController = TextEditingController();
  TextEditingController callToActionController = TextEditingController();
  List<String> dropDList = ["Learn More", "Contact Us"];
  File? imagePath;

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
    update(['callToAction']);
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

  createAdvertisement() {
    tagsListSet();
    if (validation()) {
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
    } else if (canedaController.text.isEmpty) {
      errorToast(Strings.canedaError);
      return false;
    } else if (streetController.text.isEmpty) {
      errorToast(Strings.streetError);
      return false;
    } else if (cityController.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (preovinceController.text.isEmpty) {
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
    } else if (urlLinkController.text.isEmpty) {
      errorToast(Strings.websiteError);
      return false;
    }
    return true;
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

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
      update(["location"]);
    }
  }
}
// await PrefService.setValue(PrefKeys.latitude, position.latitude);
// await PrefService.setValue(PrefKeys.longitude, position.longitude);

//   List<Placemark> placeMarks =
//       await placemarkFromCoordinates(position.latitude, position.longitude);

//   await PrefService.setValue(PrefKeys.locality, placeMarks.first.locality);
