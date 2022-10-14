import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/userSubscriptionAdd_model.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/add_cart_controller.dart';
import 'package:rainbow/screens/Home/settings/payment/add_cart/add_cart_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class UserSubscriptionAddApi {
  static Future userSubscriptionAddApi() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);

    try {
      String url = EndPoints.userSubscriptionAdd;

      http.Response? response = await HttpService.postApi(url: url,
          // body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });
      if (response != null && response.statusCode == 200) {
        flutterToast(jsonDecode(response.body)["message"]);

        return userSubscriptionAddModelFromJson(response.body);
      } else {
        AddCartController addCartController = Get.find();

        addCartController.fullNameController.clear();
        addCartController.addressController.clear();
        addCartController.cityController.clear();
        addCartController.countryController.clear();
        addCartController.postalCodeController.clear();
        addCartController.nameOnCardController.clear();
        addCartController.cardNmberController.clear();
        addCartController.expiryYearController.clear();
        addCartController.expiryMonthController.clear();
        addCartController.cvvController.clear();
        addCartController.selectCountry = null;

        Get.to(AddCartScreen());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
