import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_api/scanyourface_json.dart';
import 'package:rainbow/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class ScanYourFaceApi {
  static Future postRegister(
    String idItemSelfie,
  ) async {
    String accesToken = await PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.selfieVerification;
      Map<String, String> param = {
        'id_item_selfi': idItemSelfie /*id_item_selfi*/,
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
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          await PrefService.setValue(
              PrefKeys.loginRole, jsonDecode(response.body)["data"]["role"]);
          PrefService.setValue(PrefKeys.showTermsCondition, true);
          PrefService.setValue(PrefKeys.register, true);
          Get.to(() => TermsConditionsScreen());
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return selfiVerificationFromJson(response.body);
      }

      /*  message =="please enter a correct username and password"?errorToast(message):*/
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
