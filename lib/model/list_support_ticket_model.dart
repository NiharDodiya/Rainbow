// To parse this JSON data, do
//
//     final listSupportTicketModel = listSupportTicketModelFromJson(jsonString);

import 'dart:convert';

ListSupportTicketModel listSupportTicketModelFromJson(String? str) =>
    ListSupportTicketModel.fromJson(json.decode(str!));

String? listSupportTicketModelToJson(ListSupportTicketModel data) =>
    json.encode(data.toJson());

class ListSupportTicketModel {
  ListSupportTicketModel({
    this.status,
    this.message,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.data,
  });

  bool? status;
  String? message;
  int? cuurentPage;
  int? totalPage;
  int? count;
  List<ListTicketData>? data;

  factory ListSupportTicketModel.fromJson(Map<String, dynamic> json) =>
      ListSupportTicketModel(
        status: json["status"],
        message: json["message"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        data: json["data"] == null
            ? null
            : List<ListTicketData>.from(
                json["data"].map((x) => ListTicketData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ListTicketData {
  ListTicketData({
    this.id,
    this.tickit,
    this.idUser,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? tickit;
  int? idUser;
  String? title;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListTicketData.fromJson(Map<String, dynamic> json) => ListTicketData(
        id: json["id"],
        tickit: json["tickit"],
        idUser: json["id_user"],
        title: json["title"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tickit": tickit,
        "id_user": idUser,
        "title": title,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
