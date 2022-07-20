import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;
  MyStoryModel myStoryModel = MyStoryModel();

  // late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  Future<void> init() async {
    myStoryModel = MyStoryModel();
    await getMyStoryList((){}, (){});
    /*indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.pause);*/
  }

  Future<void> getMyStoryList(
    VoidCallback pauseAnimation,
    VoidCallback playAnimation,
  ) async {
    loader.value = true;
    myStoryModel = (await MyStoryApi.getMyStory()) ?? MyStoryModel();
    myStoryModel.data ??= [];
    /*for (var value in myStoryModel.data!) {
      if (value.storyItem != null) {
        loadImages(value.storyItem!);
      }
    }*/
    loader.value = false;
    pauseAnimation();
  }

  Future<void> loadImages(
    String image,
    VoidCallback pauseAnimation,
    VoidCallback playAnimation,
  ) async {
    loader.value = true;
    pauseAnimation();
    await DefaultCacheManager().downloadFile(image);
    loader.value = false;
    playAnimation();
  }

  void onBackTap() {
    Get.back();
  }

  void onCommentButtonTap() {}

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap() {}

  void onDeleteTap(
    int storyIndex,
    VoidCallback pauseAnimation,
    VoidCallback playAnimation,
  ) {
    pauseAnimation();
    commonAlert(
      title: "Alert!",
      content: "Are you sure you want to delete this story",
      onOkTap: () async {
        Get.back();
        loader.value = true;
        bool result = await MyStoryApi.deleteMyStory(
            myStoryModel.data![storyIndex].id.toString());
        playAnimation();
        loader.value = false;
        Get.back();
        if (result) {
          Get.offAll(() => const Dashboard());
        }
      },
      onCancelTap: () {
        Get.back();
        playAnimation();
      },
    );
  }
}
