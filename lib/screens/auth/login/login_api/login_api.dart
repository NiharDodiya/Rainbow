import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/ad_dashboard.dart';
import 'package:rainbow/screens/auth/login/login_api/advertisers_login_json.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/pref_keys.dart';

class LoginApi {
  static Future postRegister(
    String email,
    String password,
  ) async {
    try {
      String url = EndPoints.login;
      Map<String, String> param = {
        'email': email,
        'password': password,
      };
      print(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
         bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(PrefKeys.isLogin, true);
          flutterToast(jsonDecode(response.body)["message"]);
          await PrefService.setValue(PrefKeys.registerToken,
              jsonDecode(response.body)["token"].toString());
          if (jsonDecode(response.body)["data"]["user_status"] == "pending") {
            await PrefService.setValue(PrefKeys.registerToken,
                jsonDecode(response.body)["token"].toString());
            if (jsonDecode(response.body)["data"]["id_status"] == "pending") {
              Get.to(() => IdVerificationScreen());
            } else if (jsonDecode(response.body)["data"]["selfi_status"] ==
                "pending") {
              Get.to(() => SelfieVerificationScreen());
            }
          } else {
            await PrefService.setValue(
                PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
            await PrefService.setValue(
                PrefKeys.loginRole, jsonDecode(response.body)["data"]["role"]);
            Get.offAll(() =>
                jsonDecode(response.body)["data"]["role"] == "end_user"
                    ? const Dashboard()
                    :  AdvertisementDashBord());
          }
          //Get.offAll(() => const Dashboard());

        if (jsonDecode(response.body)["data"]["role"] == "end_user") {
          return loginModelFromJson(response.body);
        } else {
          return advertisersLoginModelFromJson(response.body);
        }
      } else if (response.statusCode == 500) {
        flutterToast(jsonDecode(response.body)["message"]);
      }
    } }catch (e) {
      print(e.toString());

      return loginModelFromJson('');
    }
  }
}
