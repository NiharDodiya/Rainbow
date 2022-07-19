import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/register/register_json.dart';
import 'package:rainbow/screens/getstarted_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class RegisterApi {
  static Future postRegister(
      String fullName,
      String email,
      String idSocial,
      String password,
      String confirmPassword,
      String add1,
      String add2,
      String phNo,
      String maritaStatus,
      String ethnicity,
      String birthDate,
      String noOfKids) async {
    try {
      String url = EndPoints.register;
      Map<String, String> param = {
        'fullName': fullName,
        'email': email,
        'password': password,
        'address1': add1,
        'address2': add2,
        'phoneNumber': phNo,
        'id_social': idSocial,
        'maritalStatus': maritaStatus,
        'ethnicityId': ethnicity,
        'dob': birthDate,
        'noKids': noOfKids,
        'role': "end_user",
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
          Get.to(() => const GetStartedScreens());
          await PrefService.setValue(
              PrefKeys.userId, jsonDecode(response.body)["data"]["id"]);
          await PrefService.setValue(
              PrefKeys.loginRole, jsonDecode(response.body)["data"]["role"]);
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return registerUserFromJson(response.body);
      } else if (response!.statusCode == 500) {
        flutterToast(jsonDecode(response.body)["message"]);
      } else {
        flutterToast(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      print(e.toString());
      return registerUserFromJson("");
    }
  }
}
