// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rainbow/common/popup.dart';
// import 'package:rainbow/utils/strings.dart';
//
// class SupportDetailsController extends GetxController {
//   TextEditingController yourMsgController = TextEditingController();
//   File? imagePath;
//
//   //call Camera
//   navigateToCamera() async {
//     String? path = await cameraPickImage();
//
//     if (path != null) {
//       imagePath = File(path);
//     }
//     update(["Getpic"]);
//   }
//
//   //Open Camera
//   Future<String?> cameraPickImage() async {
//     XFile? pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       return pickedFile.path;
//     }
//     update(["Getpic"]);
//
//     return null;
//   }
//
//   valid() {
//     if (yourMsgController.text.isEmpty) {
//       errorToast(Strings.supportError01);
//     }
//   }
// }
