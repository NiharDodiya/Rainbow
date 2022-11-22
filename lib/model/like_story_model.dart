// To parse this JSON data, do
//
//     final likeStoryModel = likeStoryModelFromJson(jsonString);

import 'dart:convert';

LikeStoryModel likeStoryModelFromJson(String str) =>
    LikeStoryModel.fromJson(json.decode(str));

String likeStoryModelToJson(LikeStoryModel data) => json.encode(data.toJson());

class LikeStoryModel {
  LikeStoryModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory LikeStoryModel.fromJson(Map<String, dynamic> json) => LikeStoryModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
