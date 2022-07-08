// To parse this JSON data, do
//
//     final listCountryModel = listCountryModelFromJson(jsonString);

import 'dart:convert';

List<ListCountryModel> listCountryModelFromJson(String str) => List<ListCountryModel>.from(json.decode(str).map((x) => ListCountryModel.fromJson(x)));

String listCountryModelToJson(List<ListCountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCountryModel {
  ListCountryModel({
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

  factory ListCountryModel.fromJson(Map<String, dynamic> json) => ListCountryModel(
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
