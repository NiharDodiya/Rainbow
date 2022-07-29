// To parse this JSON data, do
//
//     final postUnlikeModel = postUnlikeModelFromJson(jsonString);

import 'dart:convert';

PostUnlikeModel postUnlikeModelFromJson(String str) =>
    PostUnlikeModel.fromJson(json.decode(str));

String postUnlikeModelToJson(PostUnlikeModel data) =>
    json.encode(data.toJson());

class PostUnlikeModel {
  PostUnlikeModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PostUnlikeModel.fromJson(Map<String, dynamic> json) =>
      PostUnlikeModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
