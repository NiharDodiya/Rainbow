import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_screen.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_api/newpassword_json.dart';
import 'package:rainbow/screens/dashboard/dashBoard.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/pref_keys.dart';

class CreateNewPasswordApi {
  static Future postRegister(
      String newPassword,
      ) async {
    CreateNewPassword createList ;
    try {
      String url = EndPoints.createPassword;
      String id= await PrefService.getString(PrefKeys.id);
      Map<String, String> param = {
        'id':id ,
        'password': newPassword,
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
        }
        else if(status==true)
        {
          Get.offAll(()=>LoginScreen());
          flutterToast(jsonDecode(response.body)["message"]);
        }
     return createNewPasswordFromJson(response.body);

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