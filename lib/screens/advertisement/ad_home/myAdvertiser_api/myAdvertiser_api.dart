import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/myAdvertiser_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class MyAdvertiserApi{
  static Future myAdvertiserDataList() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.myAdvertiserList;

      Map<String, String> param = {};
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
        /*  errorToast(jsonDecode(response.body)["message"]);*/
        } else if (status == true) {
     /*     flutterToast(jsonDecode(response.body)["message"]);*/
        }
        return myAdvertiserModelFromJson(response.body);
      } else if (response!.statusCode == 400) {
      /*  errorToast(jsonDecode(response.body)["message"]);*/
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  static Future deleteAdvertiser(String? id,BuildContext context) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.deleteAdvertiser;

      Map<String, String> param = {
        "id_advertisement" : id.toString()
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
        /*  errorToast(jsonDecode(response.body)["message"]);*/
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
          Navigator.pop(context);
        }
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}