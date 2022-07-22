import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/notification_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/utils/end_points.dart';

class NotificationApi {
  static Future<NotificationModel?> getNotificationList() async {
    try {
      http.Response? response =
          await HttpService.getApi(url: EndPoints.notificationList);

      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == false) {
          errorToast("Error", title: data['status']);
          return null;
        }
        return notificationModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      errorToast("Error", title: e.toString());
      return null;
    }
  }
}
