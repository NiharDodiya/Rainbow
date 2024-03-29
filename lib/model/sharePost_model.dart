// To parse this JSON data, do
//
//     final sharePostModel = sharePostModelFromJson(jsonString);

import 'dart:convert';

SharePostModel sharePostModelFromJson(String str) =>
    SharePostModel.fromJson(json.decode(str));

String sharePostModelToJson(SharePostModel data) => json.encode(data.toJson());

class SharePostModel {
  SharePostModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory SharePostModel.fromJson(Map<String, dynamic> json) => SharePostModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
