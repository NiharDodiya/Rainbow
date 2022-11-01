import 'dart:convert';

NotificationOnOffModel notificationModelFromJson(String str) =>
    NotificationOnOffModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationOnOffModel data) =>
    json.encode(data.toJson());

class NotificationOnOffModel {
  NotificationOnOffModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory NotificationOnOffModel.fromJson(Map<String, dynamic> json) =>
      NotificationOnOffModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
