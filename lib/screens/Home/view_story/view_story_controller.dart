import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/StoryComment_model.dart';
import 'package:rainbow/model/likeStory_model.dart';
import 'package:rainbow/model/unlike_model.dart';
import 'package:rainbow/screens/Home/Story/StoryComment_api/storyComment_api.dart';
import 'package:rainbow/screens/Home/Story/friendStory_api/friendStory_model.dart';
import 'package:rainbow/screens/Home/Story/likeStory_api/likeStory_api.dart';
import 'package:rainbow/screens/Home/Story/myStory_api/myStroy_api.dart';
import 'package:rainbow/screens/Home/Story/story_screen.dart';
import 'package:rainbow/screens/Home/Story/unlike_api/unlike_api.dart';
import 'package:rainbow/screens/Home/comments/comments_screen.dart';
import 'package:rainbow/screens/Home/view_story/widgets/likes_bottomShit.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../../model/friendStroy_model.dart';
import '../../../model/myStory_model.dart';

class ViewStoryController extends GetxController {
  RxBool loader = false.obs;
  FriendStoryModel friendStoryModel = FriendStoryModel();
  MyStoryModel myStoryModel = MyStoryModel();
  UnLikeStoryModel unLikeStoryModel = UnLikeStoryModel();
  LikeStoryModel likeStoryModel = LikeStoryModel();
  StoryCommentModel storyCommentModel = StoryCommentModel();
  TextEditingController writeSomethings = TextEditingController();


  void init() {
    friendStoryApiData();
  }

  @override
  void onInit() {
    update(["friendStory"]);
    super.onInit();
  }

  void onStoryComplete() {}
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  void onBackTap() {
    Get.back();
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap(id) {
    likeStory(id);
    update(["friendStory"]);
  }

  void onUnLikeBtnTap(id) {
    unLikeStory(id);
    update(["friendStory"]);
  }

  void onLikeViewTap() {
    indicatorAnimationController.value = IndicatorAnimationCommand.pause;
    Get.bottomSheet(
      LikesBottomShit(),
      isScrollControlled: true,
    ).then((value) {
      indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    });
  }

  Future<void> myStoryApiData() async {
    try {
      loader.value = true;
      myStoryModel = (await MyStoryApi.postRegister())!;
      update(["adStory"]);
      update(["friendStory"]);
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

  Future<void> likeStory(String id) async {
    try {
      loader.value = true;
      likeStoryModel = await LikeStoryApi.postRegister(id);

      update(["friendStory"]);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> unLikeStory(String id) async {
    try {
      loader.value = true;
      unLikeStoryModel = await UnLikeStoryApi.postRegister(id);
      update(["friendStory"]);

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }
  Future<void> commentData(String id) async {
    try {
      loader.value = true;
      storyCommentModel = await StoryCommentApi.postRegister(id,writeSomethings.text.toString());

      update(["friendStory"]);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  void onCommentButtonTap( {String? id}) {

    Get.to(()=>StoryScreen(id: id,));
  }
  void commentSendTap(String id)
  {
    commentData(id);
  }
}
