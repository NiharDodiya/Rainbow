import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountry_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;

class ListOfCountryApi {
  static Future<List<ListCountryModel>> postRegister() async {
    List<ListCountryModel> countryList = [];
    try {
      String url = EndPoints.countryList;
      String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjU3MTY3MzY1LCJleHAiOjE2NTc3NzIxNjV9._482B0we5VMSYDRcb_R_J4sCypNCMVvwyt-Bl5eS3uw";


      http.Response? response = await HttpService.getApi(
          url: url,
          header: {"Content-Type": "application/json","x-access-token":token});
      if (response != null && response.statusCode == 200) {
        print(jsonDecode(response.body)["data"]);
        listCountryModelFromJson(jsonDecode(response.body)["data"]);
      }
      String message = jsonDecode(response!.body)["message"];
      /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */flutterToast(message);
      return countryList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}