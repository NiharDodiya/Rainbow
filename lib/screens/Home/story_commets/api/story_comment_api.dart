import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/StoryComment_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';

class StoryCommentApi {
  static Future<StoryCommentModel?> sendNewComment(
      String storyId, String comments) async {
    try {
      String url = EndPoints.commentStory;

      Map<String, String> param = {
        "id_story": storyId.toString(),
        "description": comments
      };
      debugPrint(param.toString());
      http.Response? response = await HttpService.postApi(
        url: url,
        body: jsonEncode(param),
      );
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return storyCommentModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
