import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_api.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_model.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:rainbow/utils/strings.dart';

class EditProfileController extends GetxController {
  TextEditingController fullName = TextEditingController(/*text: "ramika"*/);
  TextEditingController status =
      TextEditingController(/*text:"sarrogate mom"*/);
  TextEditingController age = TextEditingController(/*text:"32"*/);
  TextEditingController city = TextEditingController(/*text:"Surat"*/);
  TextEditingController height = TextEditingController(/*text: "5'2"*/);
  TextEditingController weight = TextEditingController(/*text: "126lbs"*/);
  TextEditingController ethnicity = TextEditingController();
  TextEditingController haveKids = TextEditingController(/*text: "1"*/);
  TextEditingController status1 = TextEditingController(/*text: "married"*/);
  TextEditingController instagram = TextEditingController(
      /*text: "https://www.instagram.com/accounts/login/?next=/jackiechan.official/"*/);
  TextEditingController youTube = TextEditingController(
      /*text: "https://www.youtube.com/watch?v=YwQ2eVbABsY"*/);
  TextEditingController faceBook = TextEditingController(
      /*text: "https://www.facebook.com/search/top/?q=Jacky%20Chain"*/);
  TextEditingController twitter =
      TextEditingController(/*text: "https://twitter.com/eyeofjackiechan"*/);
  TextEditingController aboutMe = TextEditingController();
  TextEditingController hobbies = TextEditingController(/*text: "Learning"*/);
  String aboutTextCounter = '';
  String hobbiesTextCounter = '';
  String? selectedEthicity;
  String? selectedStatus;
  File? frontImage;
  File? backImage;
  RxBool loader = false.obs;
  String? heightData;
  String? weightData;
  int heightFeet = 0;
  int heightInches = 0;
  String? codeId;
  ProfileController profileController = Get.put(ProfileController());
  List<String> noOfKids = ["0", "1", "2", "3", "4", "5", "6"];
  String? noKidsSelected;
  String? lat;
  String? lan;
  Position? position;

  void onInit() {
    update(["Edit_profile"]);
    super.onInit();
  }

  Future<void> init() async {
    await determinePosition();
    position = await getCurrentPosition();
    setInitData();
  }

  List advanceSearch = [
    "Surrogate Mom",
    "Sperm Donor",
    "Egg Donor",
    "Intended Parents",
    "Retired Surrogate"
  ];

  Future<void> onTapTextField(context) async {
    if (validation()) {
      for (int i = 0; i < listCountryModel.data!.length; i++) {
        if (listCountryModel.data![i].name == ethnicity.text) {
          codeId = listCountryModel.data![i].id!.toString();
          print(codeId);
        }
        print(codeId);
      }
      await editProfileApi(context);
      profileController.update(["profile"]);
      await profileController.viewProfileDetails();
    }
  }

  void setInitData() {
    ProfileController profileController = Get.find();
    fullName.text = profileController.viewProfile.data!.fullName!;
    status.text = profileController.viewProfile.data!.userStatus!;
    if (profileController.viewProfile.data!.userStatus != "") {
      selectedStatus = profileController.viewProfile.data!.userStatus!;
    }
    status1.text = profileController.viewProfile.data!.maritalStatus!;
    age.text = profileController.viewProfile.data!.age.toString() == '0'
        ? ""
        : profileController.viewProfile.data!.age.toString();
    city.text = profileController.viewProfile.data!.city!;
    height.text = profileController.viewProfile.data!.height!;
    weight.text = profileController.viewProfile.data!.weight!;
    ethnicity.text = profileController.viewProfile.data!.idEthnicity!;
    selectedEthicity = profileController.viewProfile.data!.idEthnicity!;
    haveKids.text = profileController.viewProfile.data!.noKids!.toString();
    noKidsSelected = profileController.viewProfile.data!.noKids!.toString();
    hobbies.text =
        profileController.viewProfile.data!.hobbiesAndInterest!.toString();
    instagram.text = profileController.viewProfile.data!.instagram!.toString();
    youTube.text = profileController.viewProfile.data!.youtube!.toString();
    twitter.text = profileController.viewProfile.data!.twitter!.toString();
    faceBook.text = profileController.viewProfile.data!.facebook!.toString();
    aboutMe.text = profileController.viewProfile.data!.about!.toString();
    // await PrefService.setValue(PrefKeys.registerToken, registerUser.token.toString());
    update(["Edit_profile"]);
  }

  bool validation() {
    /*   if (backImage == null) {
      errorToast(Strings.captureImageBack);
      return false;
    } else if (frontImage == null) {
      errorToast(Strings.captureImageFront);
      return false;
    } else */
    if (fullName.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (status.text.isEmpty) {
      errorToast(Strings.statusErrorEdit);
      return false;
    } else if (age.text.isEmpty) {
      errorToast(Strings.ageError);
      return false;
    } else if (city.text.isEmpty) {
      errorToast(Strings.cityError);
      return false;
    } else if (height.text.isEmpty) {
      errorToast(Strings.heightError);
      return false;
    } else if (weight.text.isEmpty) {
      errorToast(Strings.weightError);
      return false;
    } else if (ethnicity.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (haveKids.text.isEmpty) {
      errorToast(Strings.haveKids);
      return false;
    } else if (status1.text.isEmpty) {
      errorToast(Strings.status);
      return false;
    } else if (aboutMe.text.isEmpty) {
      errorToast(Strings.aboutMeError);
      return false;
    } else if (hobbies.text.isEmpty) {
      errorToast(Strings.hobbiesError);
      return false;
    }
    return true;
  }

  File? imagePathCAmear;
  File? imagePath;

  navigateToCameraFront() async {
    String? path = await cameraPickImage1();

    if (path != null) {
      frontImage = File(path);
    }
    // uploadImageApi();
    Get.back();
    update(["Edit_profile"]);
  }

  navigateToGallaryFront() async {
    String? path = await gallaryPickImage1();

    if (path != null) {
      frontImage = File(path);
    }
    // uploadImageApi();
    Get.back();

    update(["Edit_profile"]);
  }

  navigateToCameraBack() async {
    String? path = await cameraPickImage1();

    if (path != null) {
      backImage = File(path);
    }
    // uploadImageBackApi();
    Get.back();
    update(["Edit_profile"]);
  }

  navigateToGallaryBack() async {
    String? path = await gallaryPickImage1();

    if (path != null) {
      backImage = File(path);
    }
    // uploadImageBackApi();
    Get.back();
    update(["Edit_profile"]);
  }

  Future<String?> cameraPickImage1() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(["Edit_profile"]);
    Get.back();
    return null;
  }

  Future<String?> gallaryPickImage1() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    Get.back();
    update(["Edit_profile"]);

    return null;
  }

  Future frontCamera() async {
    loader.value = true;
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageFront = File(image.path);
    frontImage = imageFront;
    // uploadImageApi();
    loader.value = false;
    update(["Edit_profile"]);
  }

  Future backCamera() async {
    loader.value = true;
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    backImage = imageTemp;
    // uploadImageBackApi();
    loader.value = false;
    update(["Edit_profile"]);
  }

  UploadImage uploadImage1 = UploadImage();
  UploadImage uploadImage2 = UploadImage();

  Future<void> uploadImageApi() async {
    // loader.value = true;
    try {
      await UploadImageApi.postRegister(frontImage!.path.toString()).then(
        (value) => uploadImage1 = value!,
      );

      // loader.value = false;
    } catch (e) {
      // loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> uploadImageBackApi() async {
    // loader.value = true;
    try {
      await UploadImageApi.postRegister(backImage!.path.toString()).then(
        (value) => uploadImage2 = value!,
      );
      // loader.value = false;
    } catch (e) {
      // loader.value = false;
      debugPrint(e.toString());
    }
  }

  EditProfile editProfile = EditProfile();

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> editProfileApi(BuildContext context) async {
    loader.value = true;
    try {
      lat = position!.latitude.toString();
      lan = position!.longitude.toString();
      print(lat);
      print(lan);
      await uploadImageApi();
      await uploadImageBackApi();
      EditProfile? data = await EditProfileApi.postRegister(
        uploadImage2.data == null ? "" : uploadImage2.data!.id.toString(),
        uploadImage1.data == null ? "" : uploadImage1.data!.id.toString(),
        lat.toString(),
        lan.toString(),
        fullName.text,
        status.text,
        height.text,
        city.text,
        age.text,
        weight.text,
        codeId.toString(),
        status1.text,
        instagram.text,
        youTube.text,
        faceBook.text,
        twitter.text,
        aboutMe.text,
        hobbies.text,
        haveKids.text,
      );

      if (data != null) {
        editProfile = data;
        Navigator.pop(context);
      }
      loader.value = false;
      await firebaseFirestore
          .collection("users")
          .doc(PrefService.getString(PrefKeys.uid))
          .update({"image": uploadImage1.data!.itemUrl.toString()});
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<Position> getCurrentPosition() async {
// verify permissions

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    var _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return _currentPosition;
  }

  void onHeightSave() {
    height.text = "$heightFeet'$heightInches";
    update(["Edit_profile"]);
    Get.back();
  }

  void onWeightSave() {
    weight.text = "${weightData}lbs";
    update(["Edit_profile"]);
    Get.back();
  }
}
