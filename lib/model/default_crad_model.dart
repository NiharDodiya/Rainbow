// To parse this JSON data, do
//
//     final defaultCradModel = defaultCradModelFromJson(jsonString);

import 'dart:convert';

DefaultCradModel defaultCradModelFromJson(String str) =>
    DefaultCradModel.fromJson(json.decode(str));

String defaultCradModelToJson(DefaultCradModel data) =>
    json.encode(data.toJson());

class DefaultCradModel {
  DefaultCradModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory DefaultCradModel.fromJson(Map<String, dynamic> json) =>
      DefaultCradModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
