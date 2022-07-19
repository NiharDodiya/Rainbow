import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/phonenumber/phonenumber_api/phonenumber_json.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyphone_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class PhoneNumberApi {
  static Future postRegister(
    String phoneNumber,
  ) async {
    List<PhoneNumber> phoneList = [];
    try {
      String url = EndPoints.mobileCheck;
      Map<String, String> param = {
        'phoneNumber': phoneNumber,
      };
      print(param);

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(PrefKeys.register, true);
          await PrefService.setValue(
              PrefKeys.phoneId, jsonDecode(response.body)["data"]["id"]);
          Get.to(() => const VerifyPhoneScreen());
          flutterToast(jsonDecode(response.body)["message"]);
        }

        return phoneNumberFromJson(response.body);
      }

      /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
