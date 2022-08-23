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
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        cuurentPage: json["cuurentPage"] == null ? null : json["cuurentPage"],
        totalPage: json["totalPage"] == null ? null : json["totalPage"],
        count: json["count"] == null ? null : json["count"],
        data: json["data"] == null
            ? null
            : List<ListTicketData>.from(
                json["data"].map((x) => ListTicketData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "cuurentPage": cuurentPage == null ? null : cuurentPage,
        "totalPage": totalPage == null ? null : totalPage,
        "count": count == null ? null : count,
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
        id: json["id"] == null ? null : json["id"],
        tickit: json["tickit"] == null ? null : json["tickit"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tickit": tickit == null ? null : tickit,
        "id_user": idUser == null ? null : idUser,
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
