// To parse this JSON data, do
//
//     final unFriendModel = unFriendModelFromJson(jsonString);

import 'dart:convert';

UnFriendModel unFriendModelFromJson(String str) =>
    UnFriendModel.fromJson(json.decode(str));

String unFriendModelToJson(UnFriendModel data) => json.encode(data.toJson());

class UnFriendModel {
  UnFriendModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UnFriendModel.fromJson(Map<String, dynamic> json) => UnFriendModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
