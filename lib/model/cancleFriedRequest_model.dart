// To parse this JSON data, do
//
//     final cancelFriendRequestModel = cancelFriendRequestModelFromJson(jsonString);

import 'dart:convert';

CancelFriendRequestModel cancelFriendRequestModelFromJson(String str) =>
    CancelFriendRequestModel.fromJson(json.decode(str));

String cancelFriendRequestModelToJson(CancelFriendRequestModel data) =>
    json.encode(data.toJson());

class CancelFriendRequestModel {
  CancelFriendRequestModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory CancelFriendRequestModel.fromJson(Map<String, dynamic> json) =>
      CancelFriendRequestModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
