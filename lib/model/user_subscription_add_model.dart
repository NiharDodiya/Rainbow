// To parse this JSON data, do
//
//     final userSubscriptionAddModel = userSubscriptionAddModelFromJson(jsonString);

import 'dart:convert';

UserSubscriptionAddModel userSubscriptionAddModelFromJson(String str) =>
    UserSubscriptionAddModel.fromJson(json.decode(str));

String userSubscriptionAddModelToJson(UserSubscriptionAddModel data) =>
    json.encode(data.toJson());

class UserSubscriptionAddModel {
  UserSubscriptionAddModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UserSubscriptionAddModel.fromJson(Map<String, dynamic> json) =>
      UserSubscriptionAddModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
