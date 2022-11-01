// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/list_user_tag_model.dart';
import 'package:rainbow/model/post_comment_list_model.dart';
import 'package:rainbow/model/post_comment_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/myPost_Api/my_post_api.dart';

class CommentsController extends GetxController {
  RxBool loader = false.obs;
  TextEditingController msgController = TextEditingController();
  PostCommentModel postCommentModel = PostCommentModel();
  List<UserData> tagUserList = [];
  HomeController homeController = Get.put(HomeController());
  UploadImage uploadImage = UploadImage();
  String? replyId;
  String? nameComment;
  File? imageCamera;
  File? imageForCamera;
  RxBool refreshLoader = false.obs;
  bool reply = false;

  @override
  void onInit() {
    update(["commentPost"]);
    super.onInit();
  }

  onRefreshCode(String id) async {
    refreshLoader.value = true;
    await commentPostListData(idPost: id);
    update(["commentPost"]);
    refreshLoader.value = false;
  }

  bool validation() {
    if (msgController.text.isEmpty && imageCamera == null) {
      errorToast("please enter reply");
      return false;
    }
    return true;
  }

  void onTapSendMsg(BuildContext context, String id) {
    if (validation()) {
      commentPostData(context, id);
    }
  }

  void clearNameCommentOnTap() {
    nameComment = null;
    //replyId = null;
    update(["commentPost"]);
  }

  Future cameraImage() async {
    try {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      final imageTemp = File(pickedFile!.path);
      imageCamera = imageTemp;
      return pickedFile.path;

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  navigateToCamera() async {
    String? path = await cameraImage();
    if (path != null) {
      imageForCamera = File(path);
    }
    update(["commentPost"]);
  }

  Future galleryImage() async {
    try {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      final imageTemp = File(pickedFile!.path);
      imageCamera = imageTemp;
      return pickedFile.path;

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  PostCommentListModel postCommentListModel = PostCommentListModel();

  Future<void> commentPostListData({String? idPost}) async {
    try {
      loader.value = true;
      postCommentListModel = await MyPostApi.commentPostListApi(idPost!);
      if (kDebugMode) {
        print(postCommentListModel);
      }
      update(['home']);
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  navigateToGallery() async {
    String? path = await galleryImage();
    if (path != null) {
      imageForCamera = File(path);
    }
    update(["commentPost"]);
  }

  Future<void> uploadImageApi() async {
    loader.value = true;
    try {
      await UploadImageApi.postRegister(imageForCamera!.path.toString()).then(
        (value) => uploadImage = value!,
      );
      loader.value = false;
    } catch (e) {
      loader.value = false;
      debugPrint(e.toString());
    }
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  Future<void> commentPostData(BuildContext context, String idPost) async {
    try {
      loader.value = true;
      List<Map<String, dynamic>> list = tagUserList
          .map<Map<String, dynamic>>((e) => {
                "id_user": e.id.toString(),
                "name": e.fullName,
              })
          .toList();
      if (replyId == null) {
        if (imageForCamera != null) {
          await uploadImageApi();
        }
        postCommentModel = await MyPostApi.commentPostApi(
            context,
            idPost,
            uploadImage.data == null ? "" : uploadImage.data!.id.toString(),
            msgController.text,
            list);
      } else {
        if (imageForCamera != null) {
          await uploadImageApi();
        }
        postCommentModel = await MyPostApi.commentReplayPostApi(
            context,
            replyId.toString(),
            idPost,
            uploadImage.data == null ? "" : uploadImage.data!.id.toString(),
            msgController.text,
            list);
      }
      uploadImage.data = null;
      imageForCamera = null;

      await commentPostListData(idPost: idPost);
      await homeController.friendPostDataWithOutPagination();

      homeController.update(["home"]);
      update(['commentPost']);

      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  bool replay = false;

  void onReplyTap(String? commentId, String? name) {
    replyId = commentId;
    nameComment = name;
    replay = true;
    update(['commentPost']);
  }
}
