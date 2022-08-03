// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_api.dart';
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/model/postComment_model.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/Home/myPost_Api/myPost_api.dart';

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

  @override
  void onInit() {
    update(["commentPost"]);

    super.onInit();
  }
bool validation(){
    if(msgController.text.isEmpty){
      flutterToast("replay required");
    }
    return true;
}
void onTapSendMsg(BuildContext context,String id){
    if(validation()){
      commentPostData(context, id);
    }
}
  Future cameraImage() async {
 try{
   var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
   final imageTemp = File(pickedFile!.path);
   imageCamera = imageTemp;
   if (pickedFile != null) {
     return pickedFile.path;
   }
   update(["commentPost"]);
 }catch(e){
   print(e.toString());
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
  try{
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(pickedFile!.path);
    imageCamera = imageTemp;
    if (pickedFile != null) {
      return pickedFile.path;
    }
    update(["commentPost"]);
  }catch(e){
    print(e.toString());
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
      await homeController.commentPostListData(idPost);
      await homeController.friendPostData();

      homeController.update(["home"]);
      update(['commentPost']);

      loader.value = false;
    } catch (e) {
      debugPrint(e.toString());
      loader.value = false;
    }
  }

  void onReplyTap(String? commentId, String? name) {
    replyId = commentId;
    nameComment = name;
    update(['commentPost']);
  }
}
