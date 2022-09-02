// To parse this JSON data, do
//
//     final updateAdvertiseModel = updateAdvertiseModelFromJson(jsonString);

import 'dart:convert';

UpdateAdvertiseModel updateAdvertiseModelFromJson(String str) =>
    UpdateAdvertiseModel.fromJson(json.decode(str));

String updateAdvertiseModelToJson(UpdateAdvertiseModel data) =>
    json.encode(data.toJson());

class UpdateAdvertiseModel {
  UpdateAdvertiseModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UpdateAdvertiseModel.fromJson(Map<String, dynamic> json) =>
      UpdateAdvertiseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
