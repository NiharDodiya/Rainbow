import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/edit_advertise_model.dart';
import 'package:rainbow/model/my_advertiser_model.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class MyAdvertiserApi {
  static Future deleteAdvertiser(String? id, BuildContext context) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.deleteAdvertiser;

      Map<String, String> param = {"id_advertisement": id.toString()};

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

      return [];
    }
  }

  static Future cancelAdvertiser(String? id, BuildContext context) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.cancelAdvertiser;

      Map<String, String> param = {"id_advertisement": id.toString()};

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

      return [];
    }
  }

  static Future followUpAdvertiser(String? id, BuildContext context) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.followUpAdvertiser;

      Map<String, String> param = {"id_advertisement": id.toString()};

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
        }
      }
    } catch (e) {

      return [];
    }
  }

  static Future myAdvertiserDataList(int page, int limit) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.myAdvertiserList;

      Map<String, dynamic> param = {
        "page": page, "limit": limit
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
          /*  errorToast(jsonDecode(response.body)["message"]);*/
        } else if (status == true) {

          /*     flutterToast(jsonDecode(response.body)["message"]);*/
        }
        return myAdvertiserModelFromJson(response.body);
      } else if (response!.statusCode == 400) {
        /*  errorToast(jsonDecode(response.body)["message"]);*/
      }
    } catch (e) {

      return [];
    }
  }

  static Future editAdvertiserList({required Map<String, dynamic> data}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.editAdvertiser;

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(data),
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
        }
        return editAdvertisementModelFromJson(response.body);
      } else if (response!.statusCode == 400) {
        /*  errorToast(jsonDecode(response.body)["message"]);*/
      }
    } catch (e) {

      return [];
    }
  }

  static Future updatePostAdvertiseAPI(
      {required Map<String, dynamic> data}) async {
    AdHomeController adHomeController = Get.put(AdHomeController());

    Uri url = Uri.parse(EndPoints.updateAdvertiser);

    http.Response response =
        await http.post(url, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
      "x-access-token": PrefService.getString(PrefKeys.registerToken)
    });

    if (response.statusCode == 200) {


      //Map<String, dynamic> allData = jsonDecode(response.body);

      jsonDecode(response.body);

      //adHomeController.myAdvertiserListData();
      adHomeController.myAdvertiserListDataWithOutPagination();

      flutterToast(jsonDecode(response.body)["message"]);

      return response.statusCode;
    } else {

      errorToast("Please enter valid country name");
      return response.statusCode;
    }
  }
}
