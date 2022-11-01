// To parse this JSON data, do
//
//     final deleteStoryModel = deleteStoryModelFromJson(jsonString);

import 'dart:convert';

DeleteStoryModel deleteStoryModelFromJson(String str) =>
    DeleteStoryModel.fromJson(json.decode(str));

String deleteStoryModelToJson(DeleteStoryModel data) =>
    json.encode(data.toJson());

class DeleteStoryModel {
  DeleteStoryModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory DeleteStoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteStoryModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
