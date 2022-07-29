// To parse this JSON data, do
//
//     final createPostModel = createPostModelFromJson(jsonString);

import 'dart:convert';

CreatePostModel createPostModelFromJson(String str) =>
    CreatePostModel.fromJson(json.decode(str));

String createPostModelToJson(CreatePostModel data) =>
    json.encode(data.toJson());

class CreatePostModel {
  CreatePostModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory CreatePostModel.fromJson(Map<String, dynamic> json) =>
      CreatePostModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
