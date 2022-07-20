import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/friendStroy_model.dart';
import 'package:rainbow/screens/Home/story_commets/api/story_comment_api.dart';

class StoryCommentsController extends GetxController {
  RxBool loader = false.obs;
  List<StoryComment> comments = [];
  StoryList story = StoryList();
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

  void init(){}

  void onCommentSend(){
    // if(commentController.text.trim().isEmpty){
    //   return;
    // }
    // StoryCommentApi.sendNewComment(story.id.toString(), commentController.text);
  }
}
