import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/model/blockList_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class BlockListApi {
  static Future postRegister() async {
    try {
      String url = EndPoints.blockList;

      String accessToken = PrefService.getString(PrefKeys.registerToken);
      // String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksImlhdCI6MTY1NzIxMjg3NiwiZXhwIjoxNjU3ODE3Njc2fQ.2cGzkRwlQKDDXlMrX4r5pIMprd7uq9Ii-0Z2VwTsvcE";
      http.Response? response =
          await HttpService.postApi(url: url, body: {}, header: {
        /*"Content-Type": "application/json",*/
        "x-access-token": accessToken
      });

      if (response != null && response.statusCode == 200) {
        /*bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        else if(status==true)
        {
          // flutterToast(jsonDecode(response.body)["message"]);
          }*/
      }
      return blockListModelFromJson(response!.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
