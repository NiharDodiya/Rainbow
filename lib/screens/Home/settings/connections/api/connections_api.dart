import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/request_user_model.dart';
import 'package:rainbow/model/suggestion_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ConnectionApi {
  static Future<SuggestionModel?> getSuggestionList() async {
    try {
      String accesToken = PrefService.getString(PrefKeys.registerToken);
      Map<String, dynamic> body = {};
      http.Response? response = await HttpService.postApi(
        url: EndPoints.suggestionList,
        body: jsonEncode(body),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          }
      );
      if (response != null && response.statusCode == 200) {

        Map<String, dynamic> data = jsonDecode(response.body);

        if (data['status'] == true) {

          return suggestionModelFromJson(response.body);
        } else {
          // flutterToast(data['message']);
        }
      }
      return null;
    } catch (e) {
      // errorToast("Error", title: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<RequestUserModel?> getRequestList() async {
    try {
      Map<String, dynamic> body = {};
      http.Response? response = await HttpService.postApi(
        url: EndPoints.requestList,
        body: jsonEncode(body),
      );
      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == true) {
          return requestUserModelFromJson(response.body);
        } else {
          // flutterToast(data['message']);
          return requestUserModelFromJson(response.body);
        }
      }
      return null;
    } catch (e) {
      // errorToast("Error", title: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }
}
