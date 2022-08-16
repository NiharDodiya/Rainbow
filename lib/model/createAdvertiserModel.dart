// To parse this JSON data, do
//
//     final advertisersCreateModel = advertisersCreateModelFromJson(jsonString);

import 'dart:convert';

AdvertisersCreateModel advertisersCreateModelFromJson(String str) => AdvertisersCreateModel.fromJson(json.decode(str));

String advertisersCreateModelToJson(AdvertisersCreateModel data) => json.encode(data.toJson());

class AdvertisersCreateModel {
  AdvertisersCreateModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory AdvertisersCreateModel.fromJson(Map<String, dynamic> json) => AdvertisersCreateModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
