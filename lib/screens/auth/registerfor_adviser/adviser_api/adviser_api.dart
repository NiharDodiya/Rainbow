import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/adviser_api/adviser_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;

class AdvirtisersApi {
  static Future<List<AdvirtisersRegister>> postRegister(
      String fullName,
      String email,
      String password,
      String houseNumber,
      String streetName ,
      String phoneNumber,
      String city,
      String idCountry,
      String postalCode,
      ) async {
    List<AdvirtisersRegister> registerList = [];
    try {
      String url = EndPoints.advirtisersRegister;
      Map<String, String> param = {
        'fullName': fullName,
        'email': email,
        'password': password,
        'houseNumber': houseNumber,
        'streetName': streetName,
        'phoneNumber': phoneNumber,
        'city': city,
        'id_country': idCountry,
        'postalCode': postalCode,
        'role': "advertisers",

      };
      print(param);

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        registerList.add(advirtisersRegisterFromJson(response.body));

      }
      String message = jsonDecode(response!.body)["message"];
    /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */flutterToast(message);
      return registerList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}