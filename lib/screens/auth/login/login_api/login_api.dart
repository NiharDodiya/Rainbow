
import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
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
        'email':email,
        'password': password,
      };
      print(param);
      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {

        bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        else if(status==true)
        {
          await PrefService.setValue(PrefKeys.isLogin, true);
          flutterToast(jsonDecode(response.body)["message"]);
          Get.offAll(() => const Dashboard());
        }
        return loginModelFromJson(response.body);
      }else if(response!.statusCode == 500)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        }
    } catch (e) {
      print(e.toString());

      return [];
    }
  }
}
