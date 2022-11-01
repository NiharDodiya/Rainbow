import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/Widget/premiumPopUpBox/api/subscribe_popup_api.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/ad_addCartModel.dart';
import 'package:rainbow/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AddCartApi {
  static Future addCartDetailsApi(
    context, {
    String? cardNumber,
    String? exMonth,
    String? exYear,
    String? cvv,
    String? cardHolder,
    String? fullName,
    String? address,
    String? city,
    String? postalCode,
    String? country,
  }) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);

    try {
      String url = EndPoints.addCartDetails;

      Map<String, dynamic> param = {
        "card_number": int.parse(cardNumber!),
        "exp_month": int.parse(exMonth!),
        "exp_year": int.parse(exYear!),
        "cvv": int.parse(cvv!),
        "card_holder": cardHolder,
        "addressData": {
          "full_name": fullName,
          "address": address,
          "city": city,
          "postal_code": postalCode,
          "country": country,
        }
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
        if (status == false) {
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          //final AdvertisementController advertisementController =Get.find();

          flutterToast(jsonDecode(response.body)["message"]);


          await UserSubscriptionAddApi.userSubscriptionAddApi();
          Navigator.of(context).pop();
       /*   final PaymentController controller = Get.find();
          await controller.transactionApi();*/

          /* Get.offAll(AdvertisementDashBord());
          advertisementController.currentTab = 1;*/
        }
        return addCardModelFromJson(response.body);
      } else {
        errorToast(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {

      return [];
    }
  }
}
