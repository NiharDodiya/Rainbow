// To parse this JSON data, do
//
//     final removeCardModel = removeCardModelFromJson(jsonString);

import 'dart:convert';

RemoveCardModel removeCardModelFromJson(String str) =>
    RemoveCardModel.fromJson(json.decode(str));

String removeCardModelToJson(RemoveCardModel data) =>
    json.encode(data.toJson());

class RemoveCardModel {
  RemoveCardModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory RemoveCardModel.fromJson(Map<String, dynamic> json) =>
      RemoveCardModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
