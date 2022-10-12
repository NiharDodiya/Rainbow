import 'dart:convert';

import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/createAdvertiserModel.dart';
import 'package:rainbow/model/renewAdModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/payment_successful/payment_successful_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class RenewAdApi {
  static Future renewAdApi(
      {
        int? idAd,
        String? startDate,
        String? endDate,
        int? amount,
      }) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.renewAdvertisement;
      Map<String, dynamic> param = {
        "id_advertisement" : idAd,
        "start_date" : startDate.toString(),
        "end_date" : endDate.toString() ,
        "amount" : amount
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == true) {

          final PaymentController controller = Get.find();
          await controller.transactionApi();
          Get.to(() => PaymentSuccessfulScreen());

          flutterToast(jsonDecode(response.body)["message"]);
        }
        return renewAdModelFromJson(response.body);
      }
      /* else if(response!.statusCode == 500){
        errorToast("Please enter valid country name");
      }*/
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}