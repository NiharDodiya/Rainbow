import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/profile_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';

class OtherProfileApi {
  static Future<ProfileModel?> getOtherUerData(String userId) async {
    try {
      Map<String, dynamic> body = {"userId": userId};
      http.Response? response = await HttpService.postApi(
        url: EndPoints.viewProfile,
      );
      if(response != null && response.statusCode == 200){
        return profileModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      errorToast("Error", title: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }
}
