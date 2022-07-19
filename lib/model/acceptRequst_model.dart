// To parse this JSON data, do
//
//     final acceptRequestModel = acceptRequestModelFromJson(jsonString);

import 'dart:convert';

AcceptRequestModel acceptRequestModelFromJson(String str) =>
    AcceptRequestModel.fromJson(json.decode(str));

String acceptRequestModelToJson(AcceptRequestModel data) =>
    json.encode(data.toJson());

class AcceptRequestModel {
  AcceptRequestModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory AcceptRequestModel.fromJson(Map<String, dynamic> json) =>
      AcceptRequestModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
