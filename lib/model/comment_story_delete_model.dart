// To parse this JSON data, do
//
//     final commentStoryDeleteModel = commentStoryDeleteModelFromJson(jsonString);

import 'dart:convert';

CommentStoryDeleteModel commentStoryDeleteModelFromJson(String str) =>
    CommentStoryDeleteModel.fromJson(json.decode(str));

String commentStoryDeleteModelToJson(CommentStoryDeleteModel data) =>
    json.encode(data.toJson());

class CommentStoryDeleteModel {
  CommentStoryDeleteModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory CommentStoryDeleteModel.fromJson(Map<String, dynamic> json) =>
      CommentStoryDeleteModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
