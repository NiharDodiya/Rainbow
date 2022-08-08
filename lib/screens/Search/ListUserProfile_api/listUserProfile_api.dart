import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class ListUserProfileApi {
  static Future listUserProfileApi() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.listUserProfile;
      Map<String, String> param = {
"latitude" :" 21.2372228" ,
"longitude" : "72.8855694",
"distance" :" 32.63791885545622",
"user_status" : "mom"
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
          // flutterToast(jsonDecode(response.body)["message"]);
        }
        return listUseProfileModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


}