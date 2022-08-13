// To parse this JSON data, do
//
//     final uploadImage = uploadImageFromJson(jsonString);

import 'dart:convert';

UploadImage uploadImageFromJson(String? str) =>
    UploadImage.fromJson(json.decode(str!));

String? uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  UploadImage({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.createdAt,
    this.updatedAt,
    this.status,
    this.id,
    this.name,
    this.type,
    this.firebaseToken,
    this.ext,
    this.idUser,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  int? id;
  String? name;
  String? type;
  String? firebaseToken;
  String? ext;
  int? idUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        status: json["status"] == null ? null : json["status"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        firebaseToken:
            json["firebase_token"] == null ? null : json["firebase_token"],
        ext: json["ext"] == null ? null : json["ext"],
        idUser: json["id_user"] == null ? null : json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "status": status == null ? null : status,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "firebase_token": firebaseToken == null ? null : firebaseToken,
        "ext": ext == null ? null : ext,
        "id_user": idUser == null ? null : idUser,
      };
}
