import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/Profile/widget/edit_profile/edit_api/edit_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class EditProfileApi {
  static Future<EditProfile?> postRegister(
    String idItemBackGround,
    String idItemProfile,
    String latitude,
    String longitude,
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
    String accessToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.editProfile;

      Map<String, String> param = {
        "latitude": latitude,
        "longitude": longitude,
        "full_name": fullName,
        "user_status": userStatus,
        "height": height,
        "city": city,
        "age": age,
        "weight": weight,
        "id_ethnicity": idEthnicity,
        "marital_status": maritalStatus,
        "instagram": instagram,
        "youtube": youtube,
        "facebook": facebook,
        "twitter": twitter,
        "about_me": aboutMe,
        "hobbies_interest": hobbiesInterest,
        "no_kids": noKids,
      };

      if (idItemBackGround != "") {
        param["id_item_background"] = idItemBackGround;
      } else if (idItemProfile != "") {
        param["id_item_profile"] = idItemProfile;
      }

      print(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accessToken
          });
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          flutterToast(jsonDecode(response.body)["message"]);
        }
        return editProfileFromJson(response.body);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
