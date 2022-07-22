import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/model/storyViewList_model.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryComments_screen.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryListLike_screen.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:story/story_page_view/story_page_view.dart';

import 'widgets/myStoryViewBottom_screen.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;
  MyStoryModel myStoryModel = MyStoryModel();
  List<Story> storyLikeList = [];
  List<StorycommentList> comments = [];

  ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;

  Future<void> init() async {
    myStoryModel = MyStoryModel();
    await getMyStoryList();
    /*indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.pause);*/
  }

  StoryViewListModel storyViewListModel = StoryViewListModel();

  Future<void> getStoryViewList(String id) async {
    try {
      loader.value = true;
      pauseAnimation();
      storyViewListModel = await MyStoryApi.storyViewListAPi(id);
      Get.bottomSheet(
        StoryViewListScreen(),
        isScrollControlled: true,
      ).then((value){
        playAnimation();
      });
      loader.value = false;
    } catch (e) {
      playAnimation();
      loader.value = false;
    }
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
  }

  Future<void> loadImages(
    String image,
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

  void onCommentButtonTap({required MyStory myStory, required int storyindex}) {
    comments = myStory.storycommentList ?? [];
    Get.to(() => const MyStoryCommentsScreen());
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap({required MyStory myStory, required int storyindex}) {
    storyLikeList = myStory.storyLikeList ?? [];
    Get.bottomSheet(
      MyStoryListLike(),
      isScrollControlled: true,
    ).then((value) {
      // indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    });
  }

  void onDeleteTap(
    int storyIndex,
  ) {
    pauseAnimation();
    commonAlert(
      title: "Alert!",
      content: "Are you sure you want to delete this story",
      onOkTap: () async {
        Get.back();
        loader.value = true;
        String? result = await MyStoryApi.deleteMyStory(
            myStoryModel.data![storyIndex].id.toString());
        playAnimation();
        loader.value = false;
        Get.back();
        if (result != null) {
          Get.back();
          flutterToast(result);
        }
      },
      onCancelTap: () {
        Get.back();
        playAnimation();
      },
    );
  }

  void playAnimation() {
    if(indicatorAnimationController == null){
      return;
    }
    indicatorAnimationController!.value = IndicatorAnimationCommand.resume;
  }

  void pauseAnimation() {
    if(indicatorAnimationController == null){
      return;
    }
    indicatorAnimationController!.value = IndicatorAnimationCommand.pause;
  }
}
