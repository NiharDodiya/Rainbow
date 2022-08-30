// To parse this JSON data, do
//
//     final notificationDataModel = notificationDataModelFromJson(jsonString);

import 'dart:convert';

NotificationDataModel notificationDataModelFromJson(String str) => NotificationDataModel.fromJson(json.decode(str));

String notificationDataModelToJson(NotificationDataModel data) => json.encode(data.toJson());

class NotificationDataModel {
  NotificationDataModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  bool? data;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => NotificationDataModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data,
  };
}
