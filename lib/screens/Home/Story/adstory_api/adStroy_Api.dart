import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/adStory_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AdStoryApi {
  static Future postRegister(String idItem, String description, String idUser,
      String name, String idUser1, String name1) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.storyAdd;

      Map<String, dynamic> param = {
        "id_item": idItem,
        "description": description,
        "tag": [
          {"id_user": idUser, "name": name},
          {"id_user": idUser1, "name": name1}
        ]
      };
      print(param);
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
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast( jsonDecode(response.body)["message"]);
           Get.back();
        }
        return adStoryModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
