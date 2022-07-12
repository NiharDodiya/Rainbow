import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/privacy_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/pref_keys.dart';

  class PrivacyApi {
  static Future postRegister(
      bool profilePhoto,
      bool basicInfo,
      bool socialMedia,
      bool aboutMe,
      bool hobbiesAndInterest,
      bool testimonials,
      bool visitors,

      ) async {
    try {
      String url = EndPoints.privacy;
      String accesToken = await PrefService.getString(PrefKeys.registerToken);
      Map<String, bool> param = {
        "profile_photo": profilePhoto,
        "basic_info": basicInfo,
        "social_media": socialMedia,
        "about_me": aboutMe,
        "hobbies_interest": hobbiesAndInterest,
        "testimonials": testimonials
      };

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
       Get.back();
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return privacyModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}