import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/friendStroy_model.dart';

class StoryCommentsController extends GetxController {
  RxBool loader = false.obs;
  List<StoryCommentList> comments = [];
  MyStory story = MyStory();
  TextEditingController commentController = TextEditingController();
  List<bool> reply = [
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    true
  ];

  void init() {}

  void onCommentSend() {
    // if(commentController.text.trim().isEmpty){
    //   return;
    // }
    // StoryCommentApi.sendNewComment(story.id.toString(), commentController.text);
  }
}
