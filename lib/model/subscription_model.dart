// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String? str) =>
    SubscriptionModel.fromJson(json.decode(str!));

String? subscriptionModelToJson(SubscriptionModel data) =>
    json.encode(data.toJson());

class SubscriptionModel {
  SubscriptionModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.amount,
    this.startDate,
    this.endDate,
    this.role,
    this.userType,
  });

  double? amount;
  DateTime? startDate;
  DateTime? endDate;
  String? role;
  String? userType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        role: json["role"] == null ? null : json["role"],
        userType: json["user_type"] == null ? null : json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "start_date": startDate == null ? null : startDate!.toIso8601String(),
        "end_date": endDate == null ? null : endDate!.toIso8601String(),
        "role": role == null ? null : role,
        "user_type": userType == null ? null : userType,
      };
}
