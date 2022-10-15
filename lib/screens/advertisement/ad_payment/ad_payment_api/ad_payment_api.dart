import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ad_addCartModel.dart';
import 'package:rainbow/model/defaultCradmodel.dart';
import 'package:rainbow/model/editCardModel.dart';
import 'package:rainbow/model/listCardModel.dart';
import 'package:rainbow/model/remove_card_model.dart';
import 'package:rainbow/model/transactionModel.dart';
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

          //errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {

          //showToast ? flutterToast(jsonDecode(response.body)["message"]) : SizedBox();
        }
        return listCardModelFromJson(response.body);
      }
    } catch (e) {
      
      return [];
    }
  }

  static Future viewCardsApi({int? id}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.viewCard;

      Map<String, dynamic> data = {"id_card": id};

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


          //errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {

        }
        return viewCardModelFromJson(response.body);
      }
    } catch (e) {

      return null;
    }
  }

  static Future removeCardApi({int? id}) async {
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

          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {


          flutterToast(jsonDecode(response.body)["message"]);
        }
        return removeCardModelFromJson(response.body);
      }
    } catch (e) {

      return [];
    }
  }

  static Future transactionApi() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.transaction;

      http.Response? response = await HttpService.postApi(url: url, header: {
        "Content-Type": "application/json",
        "x-access-token": accesToken
      });
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {

          // errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {


          //flutterToast(jsonDecode(response.body)["message"]);

        }
        return transactionModelFromJson(response.body);
      }
    } catch (e) {

      return [];
    }
  }

  static Future defaultCardApi({int? id}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.defaultCard;

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

          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {


          flutterToast(jsonDecode(response.body)["message"]);
        }
        return defaultCradModelFromJson(response.body);
      }
    } catch (e) {

      return [];
    }
  }
}
