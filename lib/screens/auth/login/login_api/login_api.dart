import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Home/home_controller.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/ad_dashboard.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/AdvertiserVerifyController.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/AdvertiserVerifyOtpScreen.dart';
import 'package:rainbow/screens/auth/login/login_api/advertisers_login_json.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/register/widget/RegisterVerifyOtp_Screen.dart';
import 'package:rainbow/screens/auth/register/widget/registerVerify_controller.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/notification_service.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class LoginApi {
  static Future postRegister(
    String email,
    String password,
  ) async {
    try {
      RegisterVerifyController controller = Get.put(RegisterVerifyController());
      String url = EndPoints.login;
      Map<String, String> param = {
        'email': email,
        'password': password,
      };
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(
              PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
          await PrefService.setValue(PrefKeys.isLogin, true);

          flutterToast(jsonDecode(response.body)["message"]);

          await PrefService.setValue(PrefKeys.registerToken,
              jsonDecode(response.body)["token"].toString());

          await updateDeviceToken();

          if (jsonDecode(response.body)["data"]["role"] != "advertisers") {
            if (jsonDecode(response.body)["data"]["mobile_status"] ==
                "pending") {
              await PrefService.setValue(
                  PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
              await PrefService.setValue(PrefKeys.phonSaveNumberEndUser,
                  jsonDecode(response.body)["data"]["phone_number"]);
              controller.phoneNumber =
                  jsonDecode(response.body)["data"]["phone_number"];
              await controller.sendOtp();
              Get.to(() => const RegisterOtpScreen());
            } else if (jsonDecode(response.body)["data"]["id_status"] ==
                "pending") {
              Get.to(() => IdVerificationScreen());
            } else if (jsonDecode(response.body)["data"]["selfi_status"] ==
                "pending") {
              Get.to(() => const SelfieVerificationScreen());
            } else {

              await PrefService.setValue(
                  PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
              await PrefService.setValue(PrefKeys.loginRole,
                  jsonDecode(response.body)["data"]["role"]);

              HomeController homeController = Get.put(HomeController());
              await homeController.init();
              Get.offAll(() =>
                  jsonDecode(response.body)["data"]["role"] == "end_user"
                      ? const Dashboard()
                      : AdvertisementDashBord());
            }
          } else {
            AdvertiserVerifyController advertiserVerifyController =
                Get.put(AdvertiserVerifyController());

            await PrefService.setValue(
                PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
            await PrefService.setValue(PrefKeys.phonSaveNumberAdvertiser,
                jsonDecode(response.body)["data"]["phone_number"]);
            advertiserVerifyController.phoneNumber =
                jsonDecode(response.body)["data"]["phone_number"];
            await PrefService.setValue(
                PrefKeys.loginRole, jsonDecode(response.body)["data"]["role"]);

            if (jsonDecode(response.body)["data"]["mobile_status"] ==
                "pending") {
              advertiserVerifyController.phoneNumberRegister();
              Get.to(() => AdvertiserVerifyOtpScreen());
            } else {
              HomeController homeController = Get.put(HomeController());
               await homeController.init();
              Get.offAll(() =>
                  jsonDecode(response.body)["data"]["role"] == "end_user"
                      ? const Dashboard()
                      : AdvertisementDashBord());
            }
          }

          //Get.offAll(() => const Dashboard());

          if (jsonDecode(response.body)["data"]["role"] == "end_user") {
            return loginModelFromJson(response.body);
          } else {
            await PrefService.setValue(PrefKeys.advertiserProfileImage,
                jsonDecode(response.body)["data"]["profile_image"]);
            return advertisersLoginModelFromJson(response.body);
          }
        } else if (response.statusCode == 500) {
          errorToast(jsonDecode(response.body)["message"]);
        }
      } else if (response!.statusCode == 500) {
        errorToast(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      print(e.toString());

      return loginModelFromJson('');
    }
  }

  static Future<bool> updateDeviceToken() async {
    try {
      String? token = await NotificationService.getToken();
      Map<String, dynamic> body = {'device_token': token};
      http.Response? response = await HttpService.postApi(
        url: EndPoints.deviceToken,
        body: jsonEncode(body),
      );
      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == true) {
          // flutterToast(data['message']);
          return true;
        } else {
          errorToast(data['message']);
        }
      }
      return false;
    } catch (e) {
      errorToast("Error", title: e.toString());
      debugPrint(e.toString());
      return false;
    }
  }
}
