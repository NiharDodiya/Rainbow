import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/StoryComment_model.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/model/storyViewList_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryComments_screen.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryListLike_screen.dart';
import 'package:rainbow/screens/Home/story_commets/api/story_comment_api.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:story/story_page_view/story_page_view.dart';

import 'widgets/myStoryViewBottom_screen.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;
  MyStoryModel myStoryModel = MyStoryModel();
  List<Story> storyLikeList = [];
  List<StorycommentList> comments = [];
  int storyIndex = 0;
  bool isImageLoading = false;
  ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;
  TextEditingController writeSomething = TextEditingController();

  Future<void> init() async {
    myStoryModel = MyStoryModel();
    await getMyStoryList();
    /*indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.pause);*/
  }
  bool validation() {
    if (writeSomething.text.isEmpty) {
      errorToast("Type Something");
      return false;
    }
    return true;
  }
  void commentSendTap(String id, BuildContext context) {
    if (validation()) {
      pauseAnimation();
      if(loader.isFalse)
      {
        commentData(id);
      }
      // update(["friendStory"]);
      FocusScope.of(context).unfocus();
    }
  }
  StoryCommentModel storyCommentModel = StoryCommentModel();
  Future<void> commentData(String id) async {
    try {
      loader.value = true;
      storyCommentModel = (await StoryCommentApi.sendNewComment(
          id, writeSomething.text.toString()) ??
          StoryCommentModel());
      // await friendStoryApiData();
      playAnimation();
      // update(["friendStory"]);
      writeSomething.clear();
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
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
      ).then((value) {
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
    pauseAnimation();
    comments = myStory.storycommentList ?? [];
    Get.to(() => const MyStoryCommentsScreen())!.whenComplete(() {
      playAnimation();
    });
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap({required MyStory myStory, required int storyindex}) {
    pauseAnimation();
    storyLikeList = myStory.storyLikeList ?? [];
    Get.bottomSheet(
      MyStoryListLike(),
      isScrollControlled: true,
    ).then((value) {
      playAnimation();
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
        if (result != null) {
          loader.value = false;
          await Get.find<HomeController>().onStory();
          //flutterToast(result);
          Get.back();
        }
      },
      onCancelTap: () {
        Get.back();
        playAnimation();
      },
    );
  }

  void onStoryChange(int storyIndex) {
    this.storyIndex = storyIndex;
    viewStoryApi();
  }

  Future<void> downloadImage(BuildContext context) async {
    /*for (var story in friendStoryModel.data![currentPage].storyList!) {
      loader.value = true;
      String url = story.storyItem.toString();
      try{
        await precacheImage(NetworkImage(url), context);
      }catch(e){
        debugPrint(e.toString());
      }
    }*/
    loader.value = true;
    String url = myStoryModel.data![storyIndex].storyItem.toString();
    try {
      isImageLoading = true;
      await precacheImage(NetworkImage(url), context);
    } catch (e) {
      debugPrint(e.toString());
    }
    isImageLoading = false;
    // }
    loader.value = false;
  }

  Future<void> viewStoryApi() async {
    String storyId = myStoryModel.data![storyIndex].id.toString();
    await MyStoryApi.storyViewAPi(storyId);
  }

  void playAnimation() {
    if (indicatorAnimationController == null) {
      return;
    }
    indicatorAnimationController!.value = IndicatorAnimationCommand.resume;
  }

  void pauseAnimation() {
    if (indicatorAnimationController == null) {
      return;
    }
    indicatorAnimationController!.value = IndicatorAnimationCommand.pause;
  }
}
