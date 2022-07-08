import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/idVerification/idVerification_api/idVerification_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/pref_keys.dart';


class IdVerificationApi {
  static Future postRegister(
      String idType,
      String idNo,
      String idItemFront,
      String idItemBack,

      ) async {
    List<IdVerification> IdList = [];
    String accesToken = await PrefService.getString(PrefKeys.registerToken);
    try {
      String url = EndPoints.idVerification;
      Map<String, String> param = {
        'id_type':idType,
        'id_no': idNo,
        'id_item_front':idItemFront /*idItemFront*/,
        'id_item_back': idItemBack/*idItemBack*/,
      };

      print(param);
    /*  var request =  await http.MultipartRequest("POST",Uri.parse(url));
request.fields['id_type']=idType;
request.fields['id_no']=idNo;
      http.MultipartFile multipartFileIdFront =
      await http.MultipartFile.fromPath('id_item_front', idItemFront);
      http.MultipartFile multipartFileIdBack =
      await http.MultipartFile.fromPath('id_item_back', idItemBack);
      request.files.add(multipartFileIdFront);
      request.files.add(multipartFileIdBack);
var response =await request.send();
print(response);

*/


      http.Response? response = await HttpService.postApi(url: url,   body: jsonEncode(param),
          header: {"Content-Type": "application/json","x-access-token":accesToken});
      if (response != null && response.statusCode == 200) {
        return idVerificationFromJson(response.body);
      }
      String message = jsonDecode(response!.body)["message"];
    /*  message =="please enter a correct username and password"?errorToast(message):*/flutterToast(message);

    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}