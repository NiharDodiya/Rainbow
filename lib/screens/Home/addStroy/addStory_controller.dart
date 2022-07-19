import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/adStory_model.dart';
import 'package:rainbow/screens/Home/Story/adstory_api/adStroy_Api.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryView.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/dashboard/dashboard_controller.dart';

class AddStoryController extends GetxController {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;
  File? image;
  AdStoryModel adStoryModel = AdStoryModel();
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  RxBool loader = false.obs;

  Future camera() async {
    final getImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (getImage == null) return;
    final imageTemp = File(getImage.path);
    image = imageTemp;
    update(["Edit_profile"]);
    Get.to(() => AddStoryViewScreen());
  }

  void onImageTap(Future<File?> futureFile) async {
    image = await futureFile;
    update(["Edit_profile"]);
    Get.to(() => AddStoryViewScreen());
  }

  void onStoryPost(
      {String? des, String? user, String? name, String? user1, String? name1}) {
    uploadImageApi(des, user, name, user1, name1);
    DashboardController dashboardController = Get.find();
    dashboardController.onBottomBarChange(0);
  }

  UploadImage uploadImage = UploadImage();

  Future<void> uploadImageApi(des, user, name, user1, name1) async {
    loader.value = true;
    try {
      uploadImage = await UploadImageApi.postRegister(image!.path.toString());
      adStoryApiData(des, user, name, user1, name1);

      loader.value = false;
    } catch (e) {
      //
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> adStoryApiData(des, user, name, user1, name1) async {
    try {
      loader.value = true;
      adStoryModel = (await AdStoryApi.postRegister(
          uploadImage.data!.id.toString(), des == null ? "" : des, []))!;
      update(["adStory"]);

      loader.value = false;
      Get.offAll(() => Dashboard());
    } catch (e) {
      loader.value = false;
    }
  }
}
