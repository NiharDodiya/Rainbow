import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/StoryComment_model.dart';
import 'package:rainbow/model/friendStroy_model.dart';
import 'package:rainbow/model/storyViewList_model.dart';
import 'package:rainbow/model/unlike_model.dart';
import 'package:rainbow/screens/Home/Story/likeStory_api/likeStory_api.dart';
import 'package:rainbow/screens/Home/Story/unlike_api/unlike_api.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryComments_screen.dart';
import 'package:rainbow/screens/Home/my_story/widgets/myStoryListLike_screen.dart';
import 'package:rainbow/screens/Home/story_commets/api/story_comment_api.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../../model/likeStory_model.dart';
import 'widgets/myStoryViewBottom_screen.dart';

class MyStoryController extends GetxController {
  RxBool loader = false.obs;

  // StoryModel storyModel = StoryModel();

  // MyStoryModel myStoryModel = MyStoryModel();
  List<UserDetail> storyLikeList = [];
  List<StorycommentList> comments = [];
  int storyIndex = 0;
  bool isImageLoading = false;
  ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;
  TextEditingController writeSomething = TextEditingController();
  ViewStoryController viewStoryController = Get.put(ViewStoryController());

  Future<void> init() async {
    // myStoryModel = MyStoryModel();
    // storyModel = StoryModel();
    // await getMyStoryList();
    await viewStoryController.friendStoryApiData();
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

        commentData(id);

       update(["my_story"]);
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
       await viewStoryController.friendStoryApiData();
      playAnimation();
       update(["my_story"]);
      writeSomething.clear();
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  void onLikeBtn(id) {
    if (loader.isFalse) {
      likeStory(id);
    }
    // update(["friendStory"]);
  }
  LikeStoryModel likeStoryModel = LikeStoryModel();

  Future<void> likeStory(String id) async {
    try {
      loader.value = true;
      pauseAnimation();
      likeStoryModel = await LikeStoryApi.postRegister(id);
      playAnimation();
      await viewStoryController.friendStoryApiData();
      update(["my_story"]);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  void onUnLikeBtn(id) {
    if (loader.isFalse) {
      unLikeStory(id);
    }

    // update(["friendStory"]);
  }
  UnLikeStoryModel unLikeStoryModel=UnLikeStoryModel();
  Future<void> unLikeStory(String id) async {
    try {
      loader.value = true;
      pauseAnimation();
      unLikeStoryModel = await UnLikeStoryApi.postRegister(id);
      await viewStoryController.friendStoryApiData();
      playAnimation();
      update(["my_story"]);

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

/*
  Future<void> getMyStoryList() async {
    loader.value = true;
    myStoryModel = (await MyStoryApi.getMyStory()) ?? MyStoryModel();
    myStoryModel.data ??= [];

    */
/*for (var value in myStoryModel.data!) {
      if (value.storyItem != null) {
        loadImages(value.storyItem!);
      }
    }*/ /*

    loader.value = false;
  }
*/

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
            viewStoryController.storyModel.myStory![storyIndex].id.toString());
        if (result != null) {
          loader.value = false;
          await Get.find<HomeController>().onStory();

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
    String url = viewStoryController.storyModel.myStory![storyIndex].storyItem
        .toString();
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
    String storyId =
        viewStoryController.storyModel.myStory![storyIndex].id.toString();
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
