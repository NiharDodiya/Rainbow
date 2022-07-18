import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/cancleFriedRequest_model.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class OtherProfileApi {
  static Future<ProfileModel?> getOtherUerData(String userId) async {
    try {
      String accesToken = await PrefService.getString(PrefKeys.registerToken);
      Map<String, dynamic> body = {"userId": userId};
      http.Response? response = await HttpService.postApi(
          url: EndPoints.viewProfile,
          body: body,
          header: {"x-access-token": accesToken});
      if (response != null && response.statusCode == 200) {
        return profileModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      errorToast("Error", title: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<CancelFriendRequestModel?> cancelRequest(String id) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);

    try {
      String url = EndPoints.cancelSenderRequest;

      Map<String, String> param = {"id_receiver": id.toString()};
      print(param);
      http.Response? response = await HttpService.postApi(
        url: url,
        body: jsonEncode(param),
        header: {
          "Content-Type": "application/json",
          "x-access-token": accesToken
        },
      );
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
          return cancelFriendRequestModelFromJson(response.body);
        }
        return null;
      }
      return null;
    } catch (e) {
      errorToast("Error", title: e.toString());
      print(e.toString());
      return null;
    }
  }
}
