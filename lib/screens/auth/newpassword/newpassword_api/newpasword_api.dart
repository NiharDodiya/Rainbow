import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/newpassword/newpassword_api/newpassword_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;

class CreateNewPasswordApi {
  static Future<List<CreateNewPassword>> postRegister(
      String newPassword,


      ) async {
    List<CreateNewPassword> createList = [];
    try {
      String url = EndPoints.createPassword;
      Map<String, String> param = {
        'id': "1",
        'password': newPassword,


      };
      print(param);

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        createList.add(createNewPasswordFromJson(response.body));

      }
      String message = jsonDecode(response!.body)["message"];
      /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */flutterToast(message);
      return createList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}