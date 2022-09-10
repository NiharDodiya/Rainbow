import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ad_addCartModel.dart';
import 'package:rainbow/model/editCardModel.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/model/remove_card_model.dart';
import 'package:rainbow/model/viewAdvertiserModel.dart';
import 'package:rainbow/model/viewCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ListCartApi {

  static Future listCardsApi({required bool showToast}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.listCartDetails;

      http.Response? response = await HttpService.postApi(url: url, header: {
        "Content-Type": "application/json",
        "x-access-token": accesToken
      });
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          print("======= list card : ${response.statusCode} ======");
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          print("======= list card : ${response.statusCode} =====");
          showToast ? flutterToast(jsonDecode(response.body)["message"]) : SizedBox();
        }
        return listCardModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future viewCardsApi({int? id}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.viewCard;

      Map<String, dynamic> data = {
        "id_card": id
      };

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
          print("======= view card : ${response.statusCode} ======");
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          print("======= view card : ${response.statusCode} =====");
        }
        return viewCardModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future removeCardApi({int? id}) async{
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.removeCard;

      Map<String, dynamic> param = {
        "id_card": id,
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
          print("======= remove card : ${response.statusCode} ======");
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          print("======= remove card : ${response.statusCode} =====");

          flutterToast(jsonDecode(response.body)["message"]);


        }
        return removeCardModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


}
