// To parse this JSON data, do
//
//     final postTestimonialsModel = postTestimonialsModelFromJson(jsonString);

import 'dart:convert';

PostTestimonialsModel postTestimonialsModelFromJson(String str) =>
    PostTestimonialsModel.fromJson(json.decode(str));

String postTestimonialsModelToJson(PostTestimonialsModel data) =>
    json.encode(data.toJson());

class PostTestimonialsModel {
  PostTestimonialsModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PostTestimonialsModel.fromJson(Map<String, dynamic> json) =>
      PostTestimonialsModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
