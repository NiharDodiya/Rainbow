import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/model/listUserTag_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ListTagStoryApi {
  static Future listTagStory(String name) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.listTageStory;

      Map<String, dynamic> param = {"full_name": name};
      if (kDebugMode) {
        print(param);
      }
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
          // flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          // flutterToast(jsonDecode(response.body)["message"]);
        }
        return listUserTagModelFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
