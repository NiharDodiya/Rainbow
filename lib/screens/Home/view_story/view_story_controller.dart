import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/screens/Home/view_story/widgets/likes_bottomShit.dart';
import 'package:story/story_page_view/story_page_view.dart';

class ViewStoryController extends GetxController {
  void init() {}

  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  void onStoryComplete() {}

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
  }

  void onScreenTap(){

  }

  void onCommentButtonTap() {}
}
