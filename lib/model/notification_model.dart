/*
// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String?str) =>
    NotificationModel.fromJson(json.decode(str));

String?notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.data,
  });

  bool? status;
  int? cuurentPage;
  int? totalPage;
  int? count;
  List<NotificationData>? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        data: json["data"] == null
            ? null
            : List<NotificationData>.from(
                json["data"].map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotificationData {
  NotificationData({
    this.id,
    this.idUserReceiver,
    this.idUserSender,
    this.type,
    this.metaData,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idUserReceiver;
  int? idUserSender;
  String? type;
  int? metaData;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        idUserReceiver: json["id_user_receiver"],
        idUserSender: json["id_user_sender"],
        type: json["type"],
        metaData: json["meta_data"],
        title: json["title"],
        description: json["description"],
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
        "id_user_receiver": idUserReceiver,
        "id_user_sender": idUserSender,
        "type": type,
        "meta_data": metaData,
        "title": title,
        "description": description,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}


*/

// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String? str) =>
    NotificationModel.fromJson(json.decode(str!));

String? notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.pendingCount,
    this.data,
  });

  bool? status;
  int? cuurentPage;
  int? totalPage;
  int? count;
  int? pendingCount;
  List<NotificationData>? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        pendingCount: json["pendingCount"],
        data: json["data"] == null
            ? null
            : List<NotificationData>.from(
                json["data"].map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "pendingCount": pendingCount,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotificationData {
  NotificationData({
    this.id,
    this.idUserReceiver,
    this.idUserSender,
    this.type,
    this.metaData,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idUserReceiver;
  int? idUserSender;
  String? type;
  int? metaData;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        idUserReceiver: json["id_user_receiver"],
        idUserSender: json["id_user_sender"],
        type: json["type"],
        metaData: json["meta_data"],
        title: json["title"],
        description: json["description"],
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
        "id_user_receiver": idUserReceiver,
        "id_user_sender": idUserSender,
        "type": type,
        "meta_data": metaData,
        "title": title,
        "description": description,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
