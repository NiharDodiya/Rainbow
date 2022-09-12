import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/editCardModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class EditCardApi {
  static Future editCardApi(
      {int? idCard,
      String? exMonth,
      String? exYear,
      String? cardHolder,
      String? fullName,
      String? address,
      String? city,
      String? postalCode,
      String? country}) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.editCard;

      Map<String, dynamic> param = {
        "id_card": idCard,
        "cardData": {
          "exp_month": exMonth,
          "exp_year": exYear,
          "card_holder": cardHolder
        },
        "addressData": {
          "full_name": fullName,
          "address": address,
          "city": city,
          "postal_code": postalCode,
          "country": country,
        }
      };

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
          print("======= edit card : ${response.statusCode} ======");
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          print("======= edit card : ${response.statusCode} =====");
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return editCardModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
