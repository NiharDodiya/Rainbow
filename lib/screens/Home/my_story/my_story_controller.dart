import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:story/story_page_view/story_page_view.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;
  MyStoryModel myStoryModel = MyStoryModel();
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  void init() {
    myStoryModel = MyStoryModel();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.pause);
    getMyStoryList();
  }

  Future<void> getMyStoryList() async {
    loader.value = true;
    myStoryModel = (await MyStoryApi.getMyStory()) ?? MyStoryModel();
    myStoryModel.data ??= [];
    /*for (var value in myStoryModel.data!) {
      if (value.storyItem != null) {
        loadImages(value.storyItem!);
      }
    }*/
    loader.value = false;
    indicatorAnimationController.value = IndicatorAnimationCommand.pause;
  }

  Future<void> loadImages(String image) async {
    loader.value = true;
    indicatorAnimationController.value = IndicatorAnimationCommand.pause;
    await DefaultCacheManager().downloadFile(image);
    loader.value = false;
    indicatorAnimationController.value = IndicatorAnimationCommand.resume;
  }

  void onBackTap() {
    Get.back();
  }

  void onCommentButtonTap() {}

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap() {}

  void onDeleteTap(int storyIndex){

  }
}
