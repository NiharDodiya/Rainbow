import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/adStory_model.dart';
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/screens/Home/Story/adstory_api/adStroy_Api.dart';
import 'package:rainbow/screens/Home/addStroy/ListStoryTag_api/listStoryTag_api.dart';
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

  Future<void> onStoryPost() async {
    await uploadImageApi();
    DashboardController dashboardController = Get.find();
    dashboardController.onBottomBarChange(0);
  }

  UploadImage uploadImage = UploadImage();

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      uploadImage = await UploadImageApi.postRegister(image!.path.toString());
      await adStoryApiData();

      loader.value = false;
    } catch (e) {
      //
      loader.value = false;
      debugPrint(e.toString());
    }
  }
  ListUserTagModel listUserTagModel =ListUserTagModel();

  Future<void> listTagStoryApi(String name) async {
/*    if(name.contains("@")){
      name.replaceAll('@', '');
    }else{
      return;
    }*/
    loader.value = true;
    try {
      listUserTagModel = await ListTagStoryApi.listTagStory(name);
      loader.value = false;
    } catch (e) {
      //
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> adStoryApiData() async {
    try {
      loader.value = true;
      adStoryModel = (await AdStoryApi.postRegister(
            uploadImage.data!.id.toString(),
            key.currentState!.controller!.markupText.toString(),
            [],
          ) ??
          AdStoryModel());
      update(["adStory"]);

      loader.value = false;
      Get.offAll(() => Dashboard());
    } catch (e) {
      loader.value = false;
    }
  }

  List<Map<String,dynamic>> getMentionList(){
    listUserTagModel.data ??= [];
    return listUserTagModel.data!.map<Map<String,dynamic>>((e) => {
      'id': e.id.toString(),
      'display': e.fullName.toString(),
      'full_name': e.fullName.toString(),
      'photo': e.profileImage.toString(),
    },).toList();
  }
}
