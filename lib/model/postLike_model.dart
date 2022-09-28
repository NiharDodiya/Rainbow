// To parse this JSON data, do
//
//     final postLikeModel = postLikeModelFromJson(jsonString);

import 'dart:convert';

PostLikeModel postLikeModelFromJson(String str) =>
    PostLikeModel.fromJson(json.decode(str));

String postLikeModelToJson(PostLikeModel data) => json.encode(data.toJson());

class PostLikeModel {
  PostLikeModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PostLikeModel.fromJson(Map<String, dynamic> json) => PostLikeModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
