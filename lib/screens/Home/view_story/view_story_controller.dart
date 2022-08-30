// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/Widget/rich_text_controller.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/StoryComment_model.dart';
import 'package:rainbow/model/likeStory_model.dart';
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/model/unlike_model.dart';
import 'package:rainbow/screens/Home/Story/friendStory_api/friendStory_api.dart';
import 'package:rainbow/screens/Home/Story/likeStory_api/likeStory_api.dart';
import 'package:rainbow/screens/Home/Story/unlike_api/unlike_api.dart';
import 'package:rainbow/screens/Home/addStroy/ListStoryTag_api/listStoryTag_api.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/my_story/api/myStroy_api.dart';
import 'package:rainbow/screens/Home/story_commets/api/story_comment_api.dart';
import 'package:rainbow/screens/Home/story_commets/story_comments_screen.dart';
import 'package:rainbow/screens/Home/story_commets/story_commets_controller.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../../model/friendStroy_model.dart';

class ViewStoryController extends GetxController {
  RxBool loader = false.obs;
  StoryModel storyModel = StoryModel();

  // MyStoryModel myStoryModel = MyStoryModel();
  UnLikeStoryModel unLikeStoryModel = UnLikeStoryModel();
  LikeStoryModel likeStoryModel = LikeStoryModel();
  StoryCommentModel storyCommentModel = StoryCommentModel();
  late RichTextController writeSomethings;
  TextEditingController tagController = TextEditingController();
  ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;
  List<UserDetail> storyLikesList = [];
  int currentPage = 0;
  int storyIndex = 0;
  bool isImageLoading = false;
  List<UserData> tagUserList = [];
  ListUserTagModel listUserTagModel = ListUserTagModel();
  List<UserData> filterList = [];

  List<File> image = [];
  bool textShow = false;

  Future<void> init() async {
    // pauseAnimation();
    isImageLoading = false;
    await friendStoryApiData();
  }

  @override
  void onInit() {
    update(["createStory"]);
    writeSomethings = RichTextController(
        onMatch: onHashTagMatch,
        patternMatchMap: {
          RegExp(r"\B#[a-zA-Z0-9]+\b"):
              const TextStyle(color: ColorRes.color_FED785),
        },
        deleteOnBack: true);
    super.onInit();
  }

  void onHashTagMatch(List<String> list) {}

  void onStoryComplete() {}

  void onTextTap() {
    if (textShow == false) {
      textShow = true;
    } else {
      textShow = false;
    }
    update(["createStory"]);
  }

  void onBackTap() {
    Get.back();
  }

  void onMoreBtnTap() {}

  void onHashTagTap() {}

  void onLikeBtnTap(id) {
    if (loader.isFalse) {
      likeStory(id);
    }
    // update(["friendStory"]);
  }

  Future<String?> galleryImage() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        /*allowedExtensions: ["jpg","png","jpeg"],*/
        allowMultiple: false,
        type: FileType.image);
    if (filePickerResult != null) {
      image.add(File(filePickerResult.files.first.path!));
    }
    update(["createStory"]);
    return null;
  }

  Future<String?> cameraImage() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      image.add(File(pickedFile.path));
    }
    update(["createStory"]);
    return null;
  }

  Future<void> onChange(String? value) async {
    String sent = tagController.text;
    if (sent.isEmpty) {
      filterList = [];
      update(['createStory']);
      return;
    }
    List<String> list = sent.split(' ');
    if (list.last.isNotEmpty && list.last[0] == "@") {
      String word = list.last.replaceAll("@", '');

      listUserTagModel = await ListTagStoryApi.listTagStory(word);

      filterList = (listUserTagModel.data ?? [])
          .where((element) => element.fullName
              .toString()
              .toLowerCase()
              .contains(word.toLowerCase()))
          .toList();
      update(['createStory']);
    } else {
      filterList = [];
      update(['createStory']);
    }
  }

  void onTagTap(UserData userData) {
    tagUserList.add(userData);
    String sent = tagController.text;

    List<String> list = sent.split(' ');

    list.removeLast();

    tagController.text =
        "${list.join(' ')}${list.isEmpty ? '' : ' '}@${userData.fullName}";
    filterList = [];
    update(['createStory']);
    tagController.selection =
        TextSelection.collapsed(offset: tagController.text.length);
  }

  void onUnLikeBtnTap(id) {
    if (loader.isFalse) {
      unLikeStory(id);
    }

    // update(["friendStory"]);
  }

  bool validation() {
    if (writeSomethings.text.isEmpty) {
      errorToast("Type Something required");
      return false;
    }
    return true;
  }

/*

  void onLikeViewTap(
      {required FriendsStory friendStory, required int storyIndex}) {
    pauseAnimation();
    storyLikesList = friendStory.storyList![storyIndex].storyLikeList ?? [];
    Get.bottomSheet(
      LikesBottomShit(),
      isScrollControlled: true,
    ).then((value) {
      playAnimation();
    });
  }
*/

  Future<void> friendStoryApiData() async {
    try {
      loader.value = true;
      storyModel = (await FriendStoryApi.postRegister())!;
      update(["adStory"]);
      HomeController homeController = Get.find();
      homeController.update(['home']);
      onPageChange(currentPage);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  UploadImage uploadImage = UploadImage();
  List<int> imgIdList = [];

  Future<void> uploadImageData() async {
    // loader.value = true;
    try {
      imgIdList = [];
      for (var e in image) {
        uploadImage = await UploadImageApi.postRegister(e.path);
        imgIdList.add(uploadImage.data!.id!);
      }

      // loader.value = false;
    } catch (e) {
      // loader.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> createPostData(BuildContext context) async {
    try {
      loader.value = true;

      await uploadImageData();

      List<Map<String, dynamic>>? list = tagUserList
          .map<Map<String, dynamic>>((e) => {
                "id_user": e.id.toString(),
                "name": e.fullName,
              })
          .toList();
      storyModel = await FriendStoryApi.createPost(
          context, imgIdList, writeSomethings.text, writeSomethings.text, list);
      print(tagUserList);
      // writeSomethings.clear();
      // list!.clear();
      // imageCamera==null?"":imageCamera!.delete();
      /*   HomeController homeController = Get.find();
      homeController.friendPostListData = [];
       homeController.update(['home']);*/
      // onPageChange(currentPage);
      update(["createStory"]);
      //
      // Navigator.pop(context);

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> likeStory(String id) async {
    try {
      loader.value = true;
      pauseAnimation();
      likeStoryModel = await LikeStoryApi.postRegister(id);
      playAnimation();
      await friendStoryApiData();
      update(["friendStory"]);
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> unLikeStory(String id) async {
    try {
      loader.value = true;
      pauseAnimation();
      unLikeStoryModel = await UnLikeStoryApi.postRegister(id);
      await friendStoryApiData();
      playAnimation();
      update(["friendStory"]);

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> commentData(String id) async {
    try {
      loader.value = true;
      storyCommentModel = (await StoryCommentApi.sendNewComment(
              id, writeSomethings.text.toString()) ??
          StoryCommentModel());
      await friendStoryApiData();
      playAnimation();
      update(["friendStory"]);
      writeSomethings.clear();
      loader.value = false;
    } catch (e) {
      loader.value = false;
    }
  }

  Future<void> onCommentButtonTap(
      {required FriendsStory friendStory, required int storyIndex}) async {
    pauseAnimation();
    await friendStoryApiData();
    StoryCommentsController storyController =
        Get.put(StoryCommentsController());
    storyController.comments =
        friendStory.storyList![storyIndex].storyCommentList ?? [];
    Get.to(() => StoryCommentsScreen())!.whenComplete(() {
      playAnimation();
    });
  }

  void commentSendTap(String id, BuildContext context) {
    if (validation()) {
      pauseAnimation();

      commentData(id);
      // update(["friendStory"]);
      FocusScope.of(context).unfocus();
    }
  }

  void onTapPostStory(BuildContext context) {
    if (validation()) {
      createPostData(context);
    }
  }

  void onPageChange(int pageIndex) {
    currentPage = pageIndex;
    onStoryChange(pageIndex, 0);
  }

  void onStoryChange(int pageIndex, int storyIndex) {
    currentPage = pageIndex;
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
    String url = storyModel
        .friendsStory![currentPage].storyList![storyIndex].storyItem
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
    String storyId = storyModel.friendsStory!.isNotEmpty
        ? storyModel.friendsStory![currentPage].storyList![storyIndex].id
            .toString()
        : "0";
    await MyStoryApi.storyViewAPi(storyId);
  }

  void playAnimation() {
    if (isImageLoading || indicatorAnimationController == null) {
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

  void resetAllData() {
    filterList = [];
    tagController.clear();
  }
}
