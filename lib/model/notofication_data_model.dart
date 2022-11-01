// To parse this JSON data, do
//
//     final notificationDataModel = notificationDataModelFromJson(jsonString);

import 'dart:convert';

NotificationDataModel notificationDataModelFromJson(String str) =>
    NotificationDataModel.fromJson(json.decode(str));

String notificationDataModelToJson(NotificationDataModel data) =>
    json.encode(data.toJson());

class NotificationDataModel {
  NotificationDataModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  bool? data;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
