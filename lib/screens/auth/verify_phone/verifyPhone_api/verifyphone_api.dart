import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/verify_phone/verifyPhone_api/VerifyPhone_json.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/pref_keys.dart';

class VerifyCodeApi {
  static Future<List<VerifyCode>> postRegister(
      String verifyOtp,
      ) async {
    List<VerifyCode> verifyList = [];
    try {
      String url = EndPoints.verifyCode;
      String id= await PrefService.getString(PrefKeys.id);
      Map<String, String> param = {
        'id':id,
        'code': verifyOtp,
      };
      print(param);
      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // verifyCodeFromJson(response.body);
        await PrefService.setValue(PrefKeys.register, true);
        Get.offAll(() => const Dashboard());


      }
      String message = jsonDecode(response!.body)["message"];
      /*message =="please enter a correct username and password"?errorToast(message):*/flutterToast(message);


      return verifyList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}