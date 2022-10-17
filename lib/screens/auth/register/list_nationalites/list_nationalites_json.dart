// To parse this JSON data, do
//
//     final listNationalities = listNationalitiesFromJson(jsonString);

import 'dart:convert';

/*ListNationalities listNationalitiesFromJson(String str) => ListNationalities.fromJson(json.decode(str));

String listNationalitiesToJson(ListNationalities data) => json.encode(data.toJson());

class ListNationalities {
  ListNationalities({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory ListNationalities.fromJson(Map<String, dynamic> json) => ListNationalities(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int?id;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    status:json["status"],
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
}*/

ListNationalities listNationalitiesFromJson(String str) =>
    ListNationalities.fromJson(json.decode(str));

String listNationalitiesToJson(ListNationalities data) =>
    json.encode(data.toJson());

class ListNationalities {
  ListNationalities({
    this.status,
    this.data,
  });

  bool? status;
  List<DataCountry>? data;

  factory ListNationalities.fromJson(Map<String, dynamic> json) =>
      ListNationalities(
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
