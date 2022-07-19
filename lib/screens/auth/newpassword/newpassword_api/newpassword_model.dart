// To parse this JSON data, do
//
//     final createNewPassword = createNewPasswordFromJson(jsonString);

import 'dart:convert';

CreateNewPassword createNewPasswordFromJson(String str) =>
    CreateNewPassword.fromJson(json.decode(str));

String createNewPasswordToJson(CreateNewPassword data) =>
    json.encode(data.toJson());

class CreateNewPassword {
  CreateNewPassword({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory CreateNewPassword.fromJson(Map<String, dynamic> json) =>
      CreateNewPassword(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
