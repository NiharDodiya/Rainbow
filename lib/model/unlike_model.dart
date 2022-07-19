// To parse this JSON data, do
//
//     final unLikeStoryModel = unLikeStoryModelFromJson(jsonString);

import 'dart:convert';

UnLikeStoryModel unLikeStoryModelFromJson(String str) =>
    UnLikeStoryModel.fromJson(json.decode(str));

String unLikeStoryModelToJson(UnLikeStoryModel data) =>
    json.encode(data.toJson());

class UnLikeStoryModel {
  UnLikeStoryModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UnLikeStoryModel.fromJson(Map<String, dynamic> json) =>
      UnLikeStoryModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
