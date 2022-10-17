import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/AdvertiserTermsAndConditions_Screen/advertiserTerms_screen.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/AdvertiserVerifyController.dart';
import 'package:rainbow/screens/advertisement/change_password_advertiser_screen.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_screen.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/VerifyPhone_json.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/screens/selfie_verification/selfie_verification_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class VerifyCodeApi {
  static Future postRegister(
    String verifyOtp,
  ) async {
    try {
      String url = EndPoints.verifyCode;
      int id = PrefService.getInt(PrefKeys.userId);
      Map<String, String> param = {
        'id': id.toString(),
        'code': verifyOtp.toString(),
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // flutterToast( jsonDecode(response.body)["message"]);
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(PrefKeys.register, true);
          Get.to(() => const NewPasswordScreen());
        }
        return verifyCodeFromJson(response.body);
      }
      /*message =="please enter a correct username and password"?errorToast(message):*/

    } catch (e) {

      return verifyCodeFromJson("");
    }
  }

  static Future registerVerifyCode(
    String verifyOtp,
  ) async {
    try {
      String url = EndPoints.verifyCode;
      int userId = PrefService.getInt(PrefKeys.userId);
      Map<String, String> param = {
        'id': userId.toString(),
        'code': verifyOtp.toString(),
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // flutterToast( jsonDecode(response.body)["message"]);
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
          // await PrefService.setValue(PrefKeys.register, true);
          if (jsonDecode(response.body)["data"]["id_status"] == "pending") {
            Get.offAll(() => IdVerificationScreen());
          } else if (jsonDecode(response.body)["data"]["selfi_status"] ==
              "pending") {
            Get.offAll(() => const SelfieVerificationScreen());
          }
        }
        return verifyCodeFromJson(response.body);
      }
      /*message =="please enter a correct username and password"?errorToast(message):*/

    } catch (e) {

      return verifyCodeFromJson("");
    }
  }

  static Future advertiserVerifyCode(
    String verifyOtp,
  ) async {
    try {
      String url = EndPoints.verifyCode;
      int id = PrefService.getInt(PrefKeys.phoneId);
      Map<String, String> param = {
        'id': id.toString(),
        'code': verifyOtp.toString(),
      };
      //print(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // flutterToast( jsonDecode(response.body)["message"]);
        final AdvertiserVerifyController _controller =
            Get.put(AdvertiserVerifyController());
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(PrefKeys.register, true);
          await PrefService.setValue(
              PrefKeys.loginRole, jsonDecode(response.body)["data"]["role"]);


          if (_controller.backScreen == "AdvertisementDashBord") {
            Get.to(() => const AdvertiserChangePasswordScreen());
          } else {
            Get.to(() => const AdvertiserTermsAndConditionsScreen());
          }
        }
        return verifyCodeFromJson(response.body);
      }
      /*message =="please enter a correct username and password"?errorToast(message):*/

    } catch (e) {
      //errorToast("No internet connection");
      return verifyCodeFromJson("");
    }
  }

  static Future advertiserRegisterVerifyCode(
    String verifyOtp,
  ) async {
    try {
      String url = EndPoints.verifyCode;
      int id = PrefService.getInt(PrefKeys.phoneId);
      Map<String, String> param = {
        'id': id.toString(),
        'code': verifyOtp.toString(),
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // flutterToast( jsonDecode(response.body)["message"]);
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(PrefKeys.register, true);
          PrefService.setValue(PrefKeys.showTermsCondition, true);
          Get.to(() => const AdvertiserTermsAndConditionsScreen());
        }
        return verifyCodeFromJson(response.body);
      }
      /*message =="please enter a correct username and password"?errorToast(message):*/

    } catch (e) {

      return verifyCodeFromJson("");
    }
  }
}
