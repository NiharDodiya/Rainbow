// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) =>
    PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyModel({
    this.status,
    this.data,
  });

  bool? status;
  String? data;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
      };
}
