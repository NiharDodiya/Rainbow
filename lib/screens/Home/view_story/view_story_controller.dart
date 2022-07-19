import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/friendStroy_model.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/screens/Home/Story/friendStory_api/friendStory_model.dart';
import 'package:rainbow/screens/Home/Story/myStory_api/myStroy_api.dart';
import 'package:rainbow/screens/Home/view_story/view_story_screen.dart';

class ViewStoryController extends GetxController {
  RxBool loader = false.obs;
  FriendStoryModel friendStoryModel = FriendStoryModel();
  MyStoryModel myStoryModel = MyStoryModel();

  void init() {

    friendStoryApiData();

  }

  void onStoryComplete() {}

  void onBackTap() {
    Get.back();
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onCommentButtonTap() {}

  Future<void> myStoryApiData() async {
    try {
      loader.value = true;
      myStoryModel = (await MyStoryApi.postRegister())!;
      update(["adStory"]);

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> friendStoryApiData() async {
    try {
      loader.value = true;
      friendStoryModel = (await FriendStoryApi.postRegister())!;
      update(["adStory"]);


      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
}
