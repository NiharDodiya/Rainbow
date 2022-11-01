// To parse this JSON data, do
//
//     final addCardModel = addCardModelFromJson(jsonString);

import 'dart:convert';

AddCardModel addCardModelFromJson(String str) =>
    AddCardModel.fromJson(json.decode(str));

String addCardModelToJson(AddCardModel data) => json.encode(data.toJson());

class AddCardModel {
  AddCardModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory AddCardModel.fromJson(Map<String, dynamic> json) => AddCardModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
