import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/scanyour_face/scanyourface_api/scanyourface_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class ScanYourFaceApi {
  static Future<List<SelfiVerification>> postRegister(
      String id_item_selfi,

      ) async {
    List<SelfiVerification> loginList = [];
    String accesToken = await PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.selfieVerification;
      Map<String, String> param = {
        'id_item_selfi':"3"/*id_item_selfi*/,
      };

      print(param);


      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json","x-access-token":accesToken});
      if (response != null && response.statusCode == 200) {
        loginList.add(selfiVerificationFromJson(response.body));
      }
      String message = jsonDecode(response!.body)["message"];
      /*  message =="please enter a correct username and password"?errorToast(message):*/flutterToast(message);


      return loginList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}