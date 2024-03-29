import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ListUserProfileModel.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class ListUserProfileApi {
  static Future listUserProfileApi(
      {int? page,
      int? limit,
      String? keyWords,
      double? latitude,
      double? longitude,
      String? fullName}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url =  EndPoints.listUserProfile;

      Map<String, dynamic> param = {
        "page":page,
        "limit":limit,
        "latitude": latitude,
        "longitude": longitude,
        "distance": 50,
        "user_status":keyWords,
        "full_name" : fullName
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

  static Future listUserProfileAdvanceSearchApi(
      {/*int? page,
        int? limit,*/
        String? keyWords,
        double? latitude,
        double? longitude,
        String? fullName}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url =  EndPoints.listUserProfile;

      Map<String, dynamic> param = {
     /*   "page":page,
        "limit":limit,*/
        "latitude": latitude,
        "longitude": longitude,
        "distance": 50,
        "user_status":keyWords,
        "full_name" : fullName
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
