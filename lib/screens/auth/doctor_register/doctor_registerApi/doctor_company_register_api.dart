import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/doctor_register/doctor_registerApi/docotor_company_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class DoctorCompanyRegisterApi {
  static Future<List<CompanyRegister>> postRegister(
      String profession,
      String companyName,
      String companyNumber,
      String streetName,
      String city,
      String idCountry,
      String postalCode,
      String website) async {
    List<CompanyRegister> companyList = [];
    try {
      // String access_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjU3MTI2MzM5LCJleHAiOjE2NTc3MzExMzl9.9y7AoBYQsB3iTZgV0ArOl8syQQPPrj3fBh54B7YMvdk";
      String accessToken =
           PrefService.getBool(PrefKeys.advirtisersToken).toString();
      String url = EndPoints.companyRegister;
      Map<String, String> param = {
        'profession': profession,
        'companyName': companyName,
        'companyNumber': companyNumber,
        'streetName': streetName,
        'city': city,
        'id_country': idCountry,
        'postalCode': postalCode,
        'website': website,
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accessToken
          });
      if (response != null && response.statusCode == 200) {
        companyList.add(companyRegisterFromJson(response.body));
      }
      String message = jsonDecode(response!.body)["message"];
      /*    message == "please enter a correct username and password" ? errorToast(
          message) : */
      flutterToast(message);

      return companyList;
    } catch (e) {

      return [];
    }
  }
}
