
import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/login/login_api/login_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;


class LoginApi {
  static Future<List<LoginModel>> postRegister(
      String email,
      String password,

      ) async {
    List<LoginModel> loginList = [];
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
        loginList.add(loginModelFromJson(response.body));
      }
      String message = jsonDecode(response!.body)["message"];
      message =="please enter a correct username and password"?errorToast(message):flutterToast(message);


      return loginList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
