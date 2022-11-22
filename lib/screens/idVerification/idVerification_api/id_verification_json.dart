// To parse this JSON data, do
//
//     final idVerification = idVerificationFromJson(jsonString);

import 'dart:convert';

IdVerification idVerificationFromJson(String? str) =>
    IdVerification.fromJson(json.decode(str!));

String? idVerificationToJson(IdVerification data) => json.encode(data.toJson());

class IdVerification {
  IdVerification({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory IdVerification.fromJson(Map<String, dynamic> json) => IdVerification(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.createdAt,
    this.updatedAt,
    this.selfiStatus,
    this.id,
    this.idUser,
    this.idType,
    this.idNo,
    this.idItemFront,
    this.idItemBack,
    this.idStatus,
    this.idItemSelfi,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? selfiStatus;
  int? id;
  int? idUser;
  String? idType;
  String? idNo;
  int? idItemFront;
  int? idItemBack;
  String? idStatus;
  dynamic idItemSelfi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        selfiStatus: json["selfi_status"],
        id: json["id"],
        idUser: json["id_user"],
        idType: json["id_type"],
        idNo: json["id_no"],
        idItemFront: json["id_item_front"],
        idItemBack: json["id_item_back"],
        idStatus: json["id_status"],
        idItemSelfi: json["id_item_selfi"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "selfi_status": selfiStatus,
        "id": id,
        "id_user": idUser,
        "id_type": idType,
        "id_no": idNo,
        "id_item_front": idItemFront,
        "id_item_back": idItemBack,
        "id_status": idStatus,
        "id_item_selfi": idItemSelfi,
      };
}
