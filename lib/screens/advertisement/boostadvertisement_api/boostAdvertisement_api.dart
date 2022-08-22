import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class BoostAdvertisementApi{
  static Future boostAdvertisement(
      {List? tagUser,String? title,List? idItem,
        String? id,
        String? startDate,
        String? endDate,
        String? amount,
        String? currency,

      }) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.boostAdvertisement;
      Map<String, dynamic> param = {
        "id_advertisement" : id,
        "start_date" : startDate,
        "end_date" : endDate ,
        "amount" : amount,
        "currency" : currency

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
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);

        }

      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}