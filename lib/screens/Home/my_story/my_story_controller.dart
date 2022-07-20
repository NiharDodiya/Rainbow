import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:story/story_page_view/story_page_view.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;
  MyStoryModel myStoryModel = MyStoryModel();
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  void init() {
    indicatorAnimationController =
        ValueNotifier<IndicatorAnimationCommand>(
            IndicatorAnimationCommand.pause);
    getMyStoryList();
  }

  Future<void> getMyStoryList() async {
    loader.value = true;
    myStoryModel = (await MyStoryApi.getMyStory()) ?? MyStoryModel();
    loader.value = false;
    indicatorAnimationController.value = IndicatorAnimationCommand.resume;
  }

  void onBackTap() {
    Get.back();
  }

  void onCommentButtonTap(){}

  void onMoreBtnTap(){}

  void onHashTagTap(){}

  void onLikeBtnTap(){}
}
