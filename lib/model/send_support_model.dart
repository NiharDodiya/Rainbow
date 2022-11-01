// To parse this JSON data, do
//
//     final sendSupportModel = sendSupportModelFromJson(jsonString);

import 'dart:convert';

SendSupportModel sendSupportModelFromJson(String str) =>
    SendSupportModel.fromJson(json.decode(str));

String sendSupportModelToJson(SendSupportModel data) =>
    json.encode(data.toJson());

class SendSupportModel {
  SendSupportModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory SendSupportModel.fromJson(Map<String, dynamic> json) =>
      SendSupportModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
