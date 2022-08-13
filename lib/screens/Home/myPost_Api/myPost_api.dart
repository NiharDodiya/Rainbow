import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/friendPostView_Model.dart';
import 'package:rainbow/model/postCommentList_model.dart';
import 'package:rainbow/model/postComment_model.dart';
import 'package:rainbow/model/postLike_model.dart';
import 'package:rainbow/model/postView_model.dart';
import 'package:rainbow/model/sharePost_model.dart';
import 'package:rainbow/model/unLikePost_model.dart';
import 'package:rainbow/screens/Home/comments/comments_controller.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class MyPostApi {
  static Future sharPostApi(String id) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.sharePost;
      Map<String, String> param = {"id_post": id};

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return sharePostModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future postLikeApi(String id) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.postLike;
      Map<String, String> param = {"id_post": id};
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return postLikeModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future postUnLikeApi(String id) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.unlikePost;
      Map<String, String> param = {"id_post": id};
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return postUnlikeModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future postViewApi(String id) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.postView;
      Map<String, String> param = {"id_post": id};
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
        /*  errorToast(jsonDecode(response.body)["message"]);*/
        } else if (status == true) {
        /*  flutterToast(jsonDecode(response.body)["message"]);*/
        }
        return postViewModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future friendPostApi(int page,int limit) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = "${EndPoints.friendPostList}?page=${page}&limit=${limit}";
      // String url = EndPoints.friendPostList;
      Map<String, dynamic> param = {"page":page,
        "limit":limit};

      http.Response? response = await HttpService.postApi(
          url: url, body:jsonEncode(param) , header: {"Content-Type": "application/json","x-access-token": accesToken});

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          /*errorToast(jsonDecode(response.body)["message"]);*/
        } else if (status == true) {
          // flutterToast(jsonDecode(response.body)["message"]);
        }
        return friendPostViewModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future commentPostApi(BuildContext context, String idPost,
      String idItem, String des, List<Map<String, dynamic>> list) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.commentPost;
      Map<String, dynamic> param = {
        "id_post": idPost,
        "id_item": idItem,
        "description": des,
        "tag": list
      };
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          // errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          CommentsController commentsController = Get.find();
          commentsController.msgController.clear();
          commentsController.replyId = "";
          commentsController.nameComment = "";
          commentsController.imageForCamera =null;
          print(commentsController.imageCamera);
          commentsController.uploadImage.data =null;
          print(commentsController.uploadImage.data);
           flutterToast(jsonDecode(response.body)["message"]);

        }
        return postCommentModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future commentReplayPostApi(
      BuildContext context,
      String idComment,
      String idPost,
      String idItem,
      String des,
      List<Map<String, dynamic>> list) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.commentPost;
      Map<String, dynamic> param = {
        "id_comment": idComment,
        "id_post": idPost,
        "id_item": idItem,
        "description": des,
        "tag": list
      };
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          // errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          CommentsController commentsController = Get.find();
          commentsController.msgController.clear();
          commentsController.replyId = "";
          commentsController.nameComment = "";
          commentsController.imageForCamera =null;
           flutterToast(jsonDecode(response.body)["message"]);

        }
        return postCommentModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future commentPostListApi(String idPost) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.commentPostList;
      Map<String, dynamic> param = {"id_post": idPost};
      http.Response? response = await HttpService.postApi(
          url: url, body: param, header: {"x-access-token": accesToken});


      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        print(response.body);
        if (status == false) {
          // errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          /* flutterToast(jsonDecode(response.body)["message"]);*/
        }
        return postCommentListModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
