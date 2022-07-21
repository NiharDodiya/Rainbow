// To parse this JSON data, do
//
//     final storyCommentModel = storyCommentModelFromJson(jsonString);

import 'dart:convert';

StoryCommentModel storyCommentModelFromJson(String str) =>
    StoryCommentModel.fromJson(json.decode(str));

String storyCommentModelToJson(StoryCommentModel data) =>
    json.encode(data.toJson());

class StoryCommentModel {
  StoryCommentModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory StoryCommentModel.fromJson(Map<String, dynamic> json) =>
      StoryCommentModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
