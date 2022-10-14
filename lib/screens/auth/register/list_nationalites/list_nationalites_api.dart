import 'package:http/http.dart' as http;
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalitesJson.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';

class ListOfNationalitiesApi {
  static Future postRegister() async {

    try {
      String url = EndPoints.nationalitiesList;
      http.Response? response = await HttpService.getApi(
          url: url, header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        // flutterToast(jsonDecode(response.body)["message"]);
        return listNationalitiesFromJson(response.body);
      }
    } catch (e) {

      return listNationalitiesFromJson("");
    }
  }
}
