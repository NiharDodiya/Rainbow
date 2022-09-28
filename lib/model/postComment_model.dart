// To parse this JSON data, do
//
//     final postCommentModel = postCommentModelFromJson(jsonString);

import 'dart:convert';

PostCommentModel postCommentModelFromJson(String str) =>
    PostCommentModel.fromJson(json.decode(str));

String postCommentModelToJson(PostCommentModel data) =>
    json.encode(data.toJson());

class PostCommentModel {
  PostCommentModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PostCommentModel.fromJson(Map<String, dynamic> json) =>
      PostCommentModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
