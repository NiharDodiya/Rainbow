import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/ad_story_model.dart';
import 'package:rainbow/model/list_user_tag_model.dart';
import 'package:rainbow/screens/Home/Story/adstory_api/adStroy_Api.dart';
import 'package:rainbow/screens/Home/addStroy/ListStoryTag_api/listStoryTag_api.dart';
import 'package:rainbow/screens/Home/addStroy/widgets/addStoryView.dart';
import 'package:rainbow/screens/Home/home_controller.dart';

class AddStoryController extends GetxController {
  int currentPage = 0;
  int? lastPage;
  File? image;
  AdStoryModel adStoryModel = AdStoryModel();
  RxBool loader = false.obs;
  bool textShow = false;
  UploadImage uploadImage = UploadImage();

  void onTextTap() {
    if (textShow == false) {
      textShow = true;
      update(["adStory"]);
    } else {
      textShow = false;
      update(["adStory"]);
    }
    update(["adStory"]);
    update();
  }

  List<UserData> tagUserList = [];

  void init() {
    tagUserList = [];
  }

  Future camera() async {
    final getImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (getImage == null) return;
    final imageTemp = File(getImage.path);
    image = imageTemp;
    update(["Edit_profile"]);
    resetAllData();
    Get.to(() => AddStoryViewScreen());
  }

  void onImageTap(Future<File?> futureFile) async {
    image = await futureFile;
    update(["Edit_profile"]);
    resetAllData();
    Get.to(() => AddStoryViewScreen());
  }

  Future<void> onStoryPost() async {
    await uploadImageApi();
    // DashboardController dashboardController = Get.find();
    // dashboardController.onBottomBarChange(0);
  }

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

  ListUserTagModel listUserTagModel = ListUserTagModel();

  Future<void> listTagStoryApi(String name) async {
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
      List<Map<String, dynamic>> list = tagUserList
          .map<Map<String, dynamic>>((e) => {
                "id_user": e.id.toString(),
                "name": e.fullName,
              })
          .toList();
      loader.value = true;
      adStoryModel = (await AdStoryApi.postRegister(
            uploadImage.data!.id.toString(),
            msgController.text,
            list,
          ) ??
          AdStoryModel());
      update(["adStory"]);
      flutterToast(adStoryModel.message.toString());
      await Get.find<HomeController>().onStory();
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  /// tag mention

  TextEditingController msgController = TextEditingController();
  List<UserData> filterList = [];

  Future<void> onChange(String? value) async {
    String sent = msgController.text;

    if (sent.isEmpty) {
      filterList = [];
      update(['mention_popUp']);
      return;
    }

    List<String> list = sent.split(' ');

    if (list.last.isNotEmpty && list.last[0] == "@") {
      String word = list.last.replaceAll("@", '');

      listUserTagModel = await ListTagStoryApi.listTagStory(word);

      filterList = (listUserTagModel.data ?? [])
          .where((element) => element.fullName
              .toString()
              .toLowerCase()
              .contains(word.toLowerCase()))
          .toList();
      update(['mention_popUp']);
    } else {
      filterList = [];
      update(['mention_popUp']);
    }
  }

  void onTagTap(UserData userData) {
    tagUserList.add(userData);
    String sent = msgController.text;

    List<String> list = sent.split(' ');

    list.removeLast();

    msgController.text =
        "${list.join(' ')}${list.isEmpty ? '' : ' '}@${userData.fullName}";
    filterList = [];
    update(['mention_popUp']);
    msgController.selection =
        TextSelection.collapsed(offset: msgController.text.length);
  }

  void resetAllData() {
    filterList = [];
    msgController.clear();
  }
}
