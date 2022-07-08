import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/screens/auth/register/register_json.dart';
import 'package:rainbow/screens/getstarted_screen.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

class RegisterApi {
  static Future<List<RegisterUser>> postRegister(
      String fullName,
      String email,
      String password,
      String confirmPassword,
      String add1,
      String add2,
      String phNo,
      String maritaStatus,
      String ethnicity,
      String birthDate,
      String noOfKids) async {
    List<RegisterUser> registerList = [];
    try {
      String url = EndPoints.register;
      Map<String, String> param = {
        'fullName': fullName,
        'email': email,
        'password': password,
        'address1': add1,
        'address2': add2,
        'phoneNumber': phNo,
        'maritalStatus': maritaStatus,
        'ethnicityId': ethnicity,
        'dob': birthDate,
        'noKids': noOfKids,
        'role': "end_user",
      };
      print(param);
      /*   final Map<String, dynamic> data = new Map<String, dynamic>();
      // data['location_name']=  locationName;
      data['fullName'] = fullName;
      data['email'] = "rk@gmail.com";
      data['password'] = password;
      data['address1'] = confirmPassword;
      data['address2'] = add1;
      data['phoneNumber'] = add2;
      data['maritalStatus'] = maritaStatus;
      data['ethnicityId'] = ethnicity;
      data['dob'] = birthDate;
      data['noKids'] = noOfKids;
      data['role'] = "end_user";*/
      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {"Content-Type": "application/json"});
      if (response != null && response.statusCode == 200) {
        registerList.add(registerUserFromJson(response.body));
        Get.to(() => const GetStartedScreens());
      }
      String message = jsonDecode(response!.body)["message"];
      message == "Failed! Email is already in use!"
          ? errorToast(message)
          : flutterToast(message);
      return registerList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
