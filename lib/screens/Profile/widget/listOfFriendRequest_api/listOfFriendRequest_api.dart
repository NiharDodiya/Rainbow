import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/listOfFriendRequest_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class ListOfFriendRequestApi {
  static Future<ListOfFriendRequestModel?> postRegister(


      ) async {
    String accessToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.listOfFriendRequest;

      http.Response? response = await HttpService.postApi(url: url,   body: {},
          header: {/*"Content-Type": "application/json"*/"x-access-token":accessToken});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if(status==false)
        {
          // flutterToast(jsonDecode(response.body)["message"]);
        }
        else if(status==true)
        {
          // flutterToast( jsonDecode(response.body)["message"]);
        }

        return listOfFriendRequestModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}