// To parse this JSON data, do
//
//     final unblockModel = unblockModelFromJson(jsonString);

import 'dart:convert';

UnblockModel unblockModelFromJson(String str) =>
    UnblockModel.fromJson(json.decode(str));

String unblockModelToJson(UnblockModel data) => json.encode(data.toJson());

class UnblockModel {
  UnblockModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UnblockModel.fromJson(Map<String, dynamic> json) => UnblockModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
