import 'dart:convert';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/account_Information/ad_information_api/ad_information_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class AdInformationAPI {
  static Future adProfileView() async {
    String accesToken=  PrefService.getString(PrefKeys.registerToken);
    int userId =  PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.viewProfile;
      Map<String, String> param ={
        "userId" : userId.toString()
      };
      print(param);
      http.Response? response = await HttpService.postApi(url: url,   body:jsonEncode(param),
          header: {"Content-Type": "application/json","x-access-token":accesToken});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        else if(status==true)
        {
          // flutterToast( jsonDecode(response.body)["message"]);
          // Get.back();
        }

        return adInformationModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return adInformationModelFromJson("");
    }
  }

  static Future adProfileEdit(Map<String, Map<String,dynamic>> param1) async {
    String accesToken=  PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.adEditProfile;
      Map<String, Map<String,dynamic>> param = param1;
      print(param);
      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json","x-access-token":accesToken});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        else if(status==true)
        {
          flutterToast( jsonDecode(response.body)["message"]);
        }

        return adInformationModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return adInformationModelFromJson("");
    }

  }

}