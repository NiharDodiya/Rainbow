// To parse this JSON data, do
//
//     final renewAdModel = renewAdModelFromJson(jsonString);

import 'dart:convert';

RenewAdModel renewAdModelFromJson(String str) =>
    RenewAdModel.fromJson(json.decode(str));

String renewAdModelToJson(RenewAdModel data) => json.encode(data.toJson());

class RenewAdModel {
  RenewAdModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  String? data;

  factory RenewAdModel.fromJson(Map<String, dynamic> json) => RenewAdModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
