import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/view_story/widgets/likes_bottomShit.dart';
import 'package:story/story_page_view/story_page_view.dart';

class ViewStoryController extends GetxController {
  RxBool loader = false.obs;
  FriendStoryModel friendStoryModel = FriendStoryModel();
  MyStoryModel myStoryModel = MyStoryModel();

  void init() {

    friendStoryApiData();

  }

  void onStoryComplete() {}
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  void onBackTap() {
    Get.back();
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap() {}

  void onLikeViewTap() {
    indicatorAnimationController.value = IndicatorAnimationCommand.pause;
    Get.bottomSheet(
      LikesBottomShit(),
      isScrollControlled: true,
    ).then((value){
      indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    });
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
  void onCommentButtonTap() {}
}
