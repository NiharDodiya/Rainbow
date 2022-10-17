// To parse this JSON data, do
//
//     final adStoryModel = adStoryModelFromJson(jsonString);

import 'dart:convert';

AdStoryModel adStoryModelFromJson(String? str) =>
    AdStoryModel.fromJson(json.decode(str!));

String? adStoryModelToJson(AdStoryModel data) => json.encode(data.toJson());

class AdStoryModel {
  AdStoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory AdStoryModel.fromJson(Map<String, dynamic> json) => AdStoryModel(
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
    this.status,
    this.id,
    this.idUser,
    this.idItem,
    this.description,
    this.startDate,
    this.endDate,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  int? id;
  int? idUser;
  int? idItem;
  String? description;
  DateTime? startDate;
  DateTime? endDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        id: json["id"],
        idUser: json["id_user"],
        idItem: json["id_item"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "id": id,
        "id_user": idUser,
        "id_item": idItem,
        "description": description,
        "start_date": startDate!.toIso8601String(),
        "end_date": endDate!.toIso8601String(),
      };
}
