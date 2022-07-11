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
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
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
    this.ext,
    this.idUser,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  int? id;
  String? name;
  dynamic type;
  String? ext;
  int? idUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        ext: json["ext"],
        idUser: json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "id": id,
        "name": name,
        "type": type,
        "ext": ext,
        "id_user": idUser,
      };
}
