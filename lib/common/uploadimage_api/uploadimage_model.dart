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
        status: json["status"] ?? null,
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? null,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.name,
    this.type,
    this.firebaseToken,
    this.ext,
    this.idUser,
    this.itemUrl,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  String? name;
  String? type;
  String? firebaseToken;
  String? ext;
  int? idUser;
  String? itemUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? null,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        status: json["status"] ?? null,
        name: json["name"] ?? null,
        type: json["type"],
        firebaseToken: json["firebase_token"] ?? null,
        ext: json["ext"] ?? null,
        idUser: json["id_user"] ?? null,
        itemUrl: json["itemUrl"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "status": status ?? null,
        "name": name ?? null,
        "type": type,
        "firebase_token": firebaseToken ?? null,
        "ext": ext ?? null,
        "id_user": idUser ?? null,
        "itemUrl": itemUrl ?? null,
      };
}
