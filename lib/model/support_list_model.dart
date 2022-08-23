import 'dart:convert';

SupportListModel supportListModelFromJson(String str) =>
    SupportListModel.fromJson(json.decode(str));

String supportListModelToJson(SupportListModel data) =>
    json.encode(data.toJson());

class SupportListModel {
  bool? status;
  String? message;
  int? cuurentPage;
  int? totalPage;
  int? count;
  List<Datum>? data;

  SupportListModel({
    this.status,
    this.message,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.data,
  });

  factory SupportListModel.fromJson(Map<String, dynamic> json) =>
      SupportListModel(
        status: json["status"],
        message: json["message"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? tickit;
  int? idUser;
  String? title;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.tickit,
    this.idUser,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tickit: json["tickit"],
        idUser: json["id_user"],
        title: json["title"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tickit": tickit,
        "id_user": idUser,
        "title": title,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
