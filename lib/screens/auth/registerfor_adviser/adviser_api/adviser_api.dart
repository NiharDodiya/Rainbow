import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/AdvertiserVerifyController.dart';
import 'package:rainbow/screens/advertisement/ad_dashboard/change_password/AdvertiserVerifyOtpScreen.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/adviser_api/adviser_json.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class AdvirtisersApi {
  static Future postRegister(
      String fullName,
      String email,
      String password,
      String houseNumber,
      String streetName,
      String phoneNumber,
      String city,
      String idCountry,
      String postalCode,
      String profession,
      String comanyName,
      String companyNumber,
      String streetNam,
      String companyCity,
      String country,
      String comapanyPostalCode,
      String website) async {
    try {
      String url = EndPoints.advirtisersRegister;
      Map<String, dynamic> param = {
        "fullName": fullName,
        "email": email,
        "password": password,
        "houseNumber": houseNumber,
        "streetName": streetName,
        "phoneNumber": phoneNumber,
        "city": city,
        "id_country": idCountry,
        "postalCode": postalCode,
        "role": "advertisers",
        "company": {
          "profession": profession,
          "companyName": comanyName,
          "companyNumber": companyNumber,
          "streetName": streetName,
          "city": companyCity,
          "id_country": country,
          "postalCode": comapanyPostalCode,
          "website": website
        }
      };
      print(param);

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          // errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          AdvertiserVerifyController advertiserVerifyController =
              Get.put(AdvertiserVerifyController());
          PrefService.setValue(PrefKeys.register, true);
          await PrefService.setValue(PrefKeys.phonSaveNumberAdvertiser,
              jsonDecode(response.body)["data"]["phone_number"]);
          advertiserVerifyController.phoneNumber =
              jsonDecode(response.body)["data"]["phone_number"];
          AdvertiserVerifyController adController =
              Get.put(AdvertiserVerifyController());
          adController.backScreen = 'DoctorRegisterScreen';
          advertiserVerifyController.phoneNumberRegister();
          Get.offAll(() => AdvertiserVerifyOtpScreen());
          await PrefService.setValue(PrefKeys.companyRegister, true);
          // flutterToast(jsonDecode(response.body)["message"]);
        }
        return advertiserRegisterFromJson(response.body);
      } else if (response!.statusCode == 400) {
        // errorToast(jsonDecode(response.body)["message"]);
      } else {
        // errorToast(jsonDecode(response.body)["message"]);
      }
      /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */
      // return
    } catch (e) {
      print(e.toString());
      return advertiserRegisterFromJson("");
    }
  }
}
