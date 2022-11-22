import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/account_Information/account_information_controller.dart';
import 'package:rainbow/screens/account_Information/ad_information_api/ad_information_model.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/ad_dashboard.dart';
import 'package:rainbow/screens/advertisement/ad_home/ad_home_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AdInformationAPI {
  static Future adProfileView() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.viewProfile;
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
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          // flutterToast( jsonDecode(response.body)["message"]);
          // Get.back();
        }

        return adInformationModelFromJson(response.body);
      }
    } catch (e) {

      return adInformationModelFromJson("");
    }
  }

  static Future adProfileEdit(Map<String, Map<String, dynamic>> param1) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.adEditProfile;
      Map<String, Map<String, dynamic>> param = param1;

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

           AccountInformationController accountInformationController = Get.put(AccountInformationController());

          Get.offAll( AdvertisementDashBord());
          accountInformationController.img = false;
        }

        return adInformationModelFromJson(response.body);
      }
      return null;
    } catch (e) {

      return adInformationModelFromJson("");
    }
  }
}
