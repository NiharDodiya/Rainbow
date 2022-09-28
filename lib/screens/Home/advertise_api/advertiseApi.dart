import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/advertisement_list%5Buser%5D.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';


class AdvertiseListUser {

  static Future advertiseListUserApi() async {

    String accesToken = PrefService.getString(PrefKeys.registerToken);

    try {
      String url = EndPoints.advertiseListUser;
      http.Response? response = await HttpService.postApi(
          url: url,
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          if (kDebugMode) {
            print("======= advertiseList user : ${response.statusCode} ======");
          }
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          if (kDebugMode) {
            print("======= advertiseList user : ${response.statusCode} =====");
          }



          //flutterToast(jsonDecode(response.body)["message"]);

        }
        return advertisementListUserModelFromJson(response.body);
      }else{
        errorToast(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}