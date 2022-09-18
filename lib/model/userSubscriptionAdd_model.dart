// To parse this JSON data, do
//
//     final userSubscriptionAddModel = userSubscriptionAddModelFromJson(jsonString);

import 'dart:convert';

UserSubscriptionAddModel userSubscriptionAddModelFromJson(String str) => UserSubscriptionAddModel.fromJson(json.decode(str));

String userSubscriptionAddModelToJson(UserSubscriptionAddModel data) => json.encode(data.toJson());

class UserSubscriptionAddModel {
  UserSubscriptionAddModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UserSubscriptionAddModel.fromJson(Map<String, dynamic> json) => UserSubscriptionAddModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
