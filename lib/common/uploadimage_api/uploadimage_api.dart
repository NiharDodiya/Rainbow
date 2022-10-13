import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class UploadImageApi {
  static Future postRegister(
    String image,
  ) async {
    String accessToken = PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.uploadImage;
      Map<String, String> headers = {"x-access-token": accessToken};
      final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
      multipartRequest.headers.addAll(headers);
      http.MultipartFile multipartFileIdFront =
          await http.MultipartFile.fromPath('file', image);

      multipartRequest.files.add(multipartFileIdFront);

      var response = await multipartRequest.send();
      if (kDebugMode) {
        print(response);
      }
      var responded = await http.Response.fromStream(response);
      final responseData = json.decode(responded.body);
      if (kDebugMode) {
        print(responseData);
      }
      return uploadImageFromJson(responded.body);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
