// To parse this JSON data, do
//
//     final editCardModel = editCardModelFromJson(jsonString);

import 'dart:convert';

EditCardModel editCardModelFromJson(String str) =>
    EditCardModel.fromJson(json.decode(str));

String editCardModelToJson(EditCardModel data) => json.encode(data.toJson());

class EditCardModel {
  EditCardModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory EditCardModel.fromJson(Map<String, dynamic> json) => EditCardModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
