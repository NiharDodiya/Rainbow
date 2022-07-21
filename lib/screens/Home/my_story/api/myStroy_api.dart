import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/model/storyViewList_model.dart';
import 'package:rainbow/model/storyView_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';

class MyStoryApi {


  static Future<MyStoryModel?> getMyStory() async {
    try {
      String url = EndPoints.myStory;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast("Error",title: jsonDecode(response.body)["message"]);
          return null;
        }
        return myStoryModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      errorToast("Error", title: e.toString());
      return null;
    }
  }
  static Future<bool> deleteMyStory(String storyId) async {
    try {
      String url = EndPoints.deleteStory;
      Map<String, dynamic> body = {"id_stroy": storyId};
      http.Response? response =
          await HttpService.postApi(url: url, body: jsonEncode(body));

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast("Error",title: jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      errorToast("Error", title: e.toString());
      return false;
    }
  }
  static Future storyViewAPi() async {
    try {
      String url = EndPoints.storyView;
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast("Error",title: jsonDecode(response.body)["message"]);
          return null;
        }
        return storyViewModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      errorToast("Error", title: e.toString());
      return null;
    }
  }
  static Future storyViewListAPi(String id) async {
    try {
      String url = EndPoints.storyViewList;
      Map<String, dynamic> body = {"id_story": id.toString()};
      http.Response? response = await HttpService.postApi(url: url,body:jsonEncode(body) );

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast("Error",title: jsonDecode(response.body)["message"]);
          return null;
        }
        return storyViewListModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      errorToast("Error", title: e.toString());
      return null;
    }
  }


}
