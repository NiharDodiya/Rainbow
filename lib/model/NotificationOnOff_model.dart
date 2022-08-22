// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationOnOffModel notificationModelFromJson(String str) => NotificationOnOffModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationOnOffModel data) => json.encode(data.toJson());

class NotificationOnOffModel {
  NotificationOnOffModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory NotificationOnOffModel.fromJson(Map<String, dynamic> json) => NotificationOnOffModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}