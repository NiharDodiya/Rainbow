import 'dart:convert';

UserSupportModel userSupportModelFromJson(String str) =>
    UserSupportModel.fromJson(json.decode(str));

String userSupportModelToJson(UserSupportModel data) =>
    json.encode(data.toJson());

class UserSupportModel {
  UserSupportModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory UserSupportModel.fromJson(Map<String, dynamic> json) =>
      UserSupportModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
