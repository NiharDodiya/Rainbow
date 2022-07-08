import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class EditProfileApi {
  static Future postRegister(
      String idItemBackGround,
      String idItemProfile,
      String fullName,
      String userStatus,
      String height,
      String city,
      String age,
      String weight,
      String idEthnicity,
      String maritalStatus,
      String instagram,
      String youtube,
      String facebook,
      String twitter,
      String aboutMe,
      String hobbiesInterest,
      String noKids,

      ) async {
    EditProfile editProfile;
    String accesToken = await PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.editProfile;
      Map<String, String> param = {
        "id_item_background" : idItemBackGround,
        "id_item_profile" : idItemProfile,
        "full_name" : fullName,
        "user_status": userStatus,
        "height" : height,
        "city" : city ,
        "age" : age,
        "weight" : weight,
        "id_ethnicity" :idEthnicity,
        "marital_status" : maritalStatus,
        "instagram" : instagram,
        "youtube" : youtube,
        "facebook" : facebook,
        "twitter" : twitter,
        "about_me" : aboutMe,
        "hobbies_interest" : hobbiesInterest,
        "no_kids": noKids
      };

      print(param);


      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json","x-access-token":accesToken});
      if (response != null && response.statusCode == 200) {
        flutterToast( jsonDecode(response.body)["message"]);
        Get.back();
        return editProfileFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}