// To parse this JSON data, do
//
//     final editCardModel = editCardModelFromJson(jsonString);

import 'dart:convert';

EditCardModel editCardModelFromJson(String str) => EditCardModel.fromJson(json.decode(str));

String editCardModelToJson(EditCardModel data) => json.encode(data.toJson());

class EditCardModel {
  EditCardModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory EditCardModel.fromJson(Map<String, dynamic> json) => EditCardModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}
