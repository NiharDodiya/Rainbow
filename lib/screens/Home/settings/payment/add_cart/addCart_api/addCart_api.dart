import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ad_addCartModel.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AddCartApi {
  static Future addCartDetailsApi({String? cardNumber, String? exMonth, String? exYear, String? cvv, String? cardHolder, String? fullName, String? address, String? city, String? postalCode, String? country}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);

    try {
      String url = EndPoints.addCartDetails;

      Map<String, String> param = {
        "card_number": cardNumber.toString(),
        "exp_month": exMonth.toString(),
        "exp_year": exYear.toString(),
        "cvv" : cvv.toString(),
        "card_holder": cardHolder.toString(),
        "addressData" : {
          "full_name": "mirav jasoliya",
          "address": "surat",
          "city": "surat",
          "postal_code": 36925,
          "country": "united states"
        }
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
           flutterToast(jsonDecode(response.body)["message"]);
        }
        return addCardModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
