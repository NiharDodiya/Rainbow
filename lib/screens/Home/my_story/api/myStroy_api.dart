import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myStory_model.dart';
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
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
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
}
