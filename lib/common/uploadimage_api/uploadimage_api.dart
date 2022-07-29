import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rainbow/common/uploadimage_api/uploadimage_model.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class UploadImageApi {
  static Future postRegister(
    String image,
  ) async {
    String accesToken = await PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.uploadImage;
      Map<String, String> headers = {"x-access-token": accesToken};
      final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
      multipartRequest.headers.addAll(headers);
      http.MultipartFile multipartFileIdFront =
          await http.MultipartFile.fromPath('file', image);

      multipartRequest.files.add(multipartFileIdFront);

      var response = await multipartRequest.send();
      print(response);
      var responsed = await http.Response.fromStream(response);
      final responseData = json.decode(responsed.body);
      return uploadImageFromJson(responsed.body);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
