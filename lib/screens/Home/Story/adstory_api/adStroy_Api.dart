import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/adStory_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AdStoryApi {
  static Future postRegister(String idItem, String description,
      List<Map<String, dynamic>> list) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.storyAdd;

      Map<String, dynamic> param = {
        "id_item": idItem,
        "description": description,
        "tag": list
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
        }
        return adStoryModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
