import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/model/viewAdvertiserModel.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ViewAdvertiserApi {
  static Future viewAdvertiserData() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.viewUserAdvertiser;
      int userId = PrefService.getInt(PrefKeys.userId);
      Map<String, String> param = {"userId": userId.toString()};

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
          /*     flutterToast(jsonDecode(response.body)["message"]);*/
        }
        return viewAdvertiserModelFromJson(response.body);
      } else if (response!.statusCode == 400) {
        /*  errorToast(jsonDecode(response.body)["message"]);*/
      }
    } catch (e) {

      return [];
    }
  }
}
