import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myStory_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class MyStoryApi {
  static Future postRegister() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.myStory;

  /*    Map<String, dynamic> param = {
        "id_item": idItem,
        "description": description,
        "tag": list
      };*/

      http.Response? response = await HttpService.postApi(
          url: url,
          body: {},
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast( jsonDecode(response.body)["message"]);

        }
        return myStoryModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
