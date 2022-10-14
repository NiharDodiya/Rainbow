import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';

import '../../../../../common/popup.dart';
import '../../../../../service/pref_services.dart';
import '../support_controller.dart';

class SupportAPI {
  SupportAPI._();

  SupportController supportController = Get.put(SupportController());
  static final SupportAPI supportAPI = SupportAPI._();

  postSupportAPI({required Map<String, dynamic> data, context}) async {
    Uri url = Uri.parse(EndPoints.userSupport);

    http.Response response =
        await http.post(url, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
      "x-access-token": PrefService.getString(PrefKeys.registerToken)
    });

    if (response.statusCode == 200) {

      Navigator.of(context).pop();
      flutterToast(jsonDecode(response.body)["message"]);

      return response.statusCode;
    } else {

      return response.statusCode;
    }
  }
}
