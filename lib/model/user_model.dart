// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.email,
    this.photo,
    this.name,
    this.userName,
    this.role,
    this.isOnline,
    this.fcmToken,
  });

  String? uid;
  String? email;
  String? photo;
  String? name;
  String? userName;
  String? role;
  bool? isOnline;
  String? fcmToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        photo: json["photo"],
        name: json["name"],
        userName: json["userName"],
        role: json["role"],
        isOnline: json["isOnline"],
        fcmToken: json["fcmToken"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "photo": photo,
        "name": name,
        "userName": userName,
        "role": role,
        "isOnline": isOnline,
        "fcmToken": fcmToken,
      };

  Map<String, dynamic> updateJson() {
    Map<String, dynamic> map = {
      "uid": uid,
      "email": email,
      "photo": photo,
      "name": name,
      "userName": userName,
      "role": role,
      "isOnline": isOnline,
      "fcmToken": fcmToken,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
