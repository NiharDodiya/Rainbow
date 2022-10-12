import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_api/login_api.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/auth/register/register_controller.dart';
import 'package:rainbow/screens/auth/register/register_screen.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/screens/selfie_verification/selfieVerification_controller.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class GoogleIdVerification {
  static Future<LoginModel?> postRegister(
    String id, {
    User? user,
        String? email
  }) async {
    try {
      String url = EndPoints.verificationSocial;
      Map<String, String> param = {
        'id_social': id,
        'email':email.toString()
      };
      print(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          //flutterToast(jsonDecode(response.body)["message"]);
          final RegisterController controller = Get.put(RegisterController());
          controller.isSocial = true;
          controller.socialId = id;
          controller.emailController.text = user!.email ?? "";
          controller.fullNameController.text = user.displayName ?? "";
          controller.phoneController.text = user.phoneNumber ?? "";
          Get.to(() => RegisterScreen());
        } else {
          await PrefService.setValue(PrefKeys.userId,
              jsonDecode(response.body)["data"]["id"]);
          await PrefService.setValue(PrefKeys.registerToken,
              jsonDecode(response.body)["token"].toString());
          if (jsonDecode(response.body)["data"]["status"] == "pending") {
            await PrefService.setValue(PrefKeys.registerToken,
                jsonDecode(response.body)["token"].toString());
            LoginApi.updateDeviceToken();
            if (jsonDecode(response.body)["data"]["id_status"] == "pending") {
              Get.to(() => IdVerificationScreen());
            } else if (jsonDecode(response.body)["data"]["selfi_status"] ==
                "pending") {
              SelfieController selfieController = Get.put(SelfieController());
              selfieController.onNextTap();
              // Get.to(() => ScanYourFaceScreen());
            }
          } else {
            await PrefService.setValue(PrefKeys.isLogin, true);
            Get.offAll(() => const Dashboard());
          }
        }
        return loginModelFromJson(response.body);
      } else if (response!.statusCode == 500) {
       // flutterToast(jsonDecode(response.body)["message"]);
      }
      return null;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
