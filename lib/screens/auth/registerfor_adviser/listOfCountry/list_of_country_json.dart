// To parse this JSON data, do
//
//     final listCountryModel = listCountryModelFromJson(jsonString);

import 'dart:convert';

ListCountryModel listCountryModelFromJson(String str) =>
    ListCountryModel.fromJson(json.decode(str));

String listCountryModelToJson(ListCountryModel data) =>
    json.encode(data.toJson());

class ListCountryModel {
  ListCountryModel({
    this.status,
    this.data,
  });

  bool? status;
  List<DataCountry>? data;

  factory ListCountryModel.fromJson(Map<String, dynamic> json) =>
      ListCountryModel(
        status: json["status"],
        data: List<DataCountry>.from(
            json["data"].map((x) => DataCountry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataCountry {
  DataCountry({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataCountry.fromJson(Map<String, dynamic> json) => DataCountry(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
