// To parse this JSON data, do
//
//     final myAdvertiserModel = myAdvertiserModelFromJson(jsonString);

import 'dart:convert';

MyAdvertiserModel myAdvertiserModelFromJson(String? str) =>
    MyAdvertiserModel.fromJson(json.decode(str!));

String? myAdvertiserModelToJson(MyAdvertiserModel data) =>
    json.encode(data.toJson());

class MyAdvertiserModel {
  MyAdvertiserModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<MyAdvertiserData>? data;

  factory MyAdvertiserModel.fromJson(Map<String, dynamic> json) =>
      MyAdvertiserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<MyAdvertiserData>.from(
                json["data"].map((x) => MyAdvertiserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MyAdvertiserData {
  MyAdvertiserData({
    this.id,
    this.tagsList,
    this.itemsList,
    this.title,
    this.location,
    this.street,
    this.province,
    this.postalCode,
    this.date,
    this.startDate,
    this.endDate,
    this.description,
    this.callAction,
    this.advViewCount,
    this.advClickCount,
    this.urlLink,
    this.amount,
    this.currency,
    this.adminStatus,
    this.isActive,
    this.status,
  });

  int? id;
  List<String>? tagsList;
  List<String>? itemsList;
  String? title;
  String? location;
  String? street;
  String? province;
  String? postalCode;
  DateTime? date;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? callAction;
  int? advViewCount;
  int? advClickCount;
  String? urlLink;
  String? amount;
  dynamic currency;
  String? adminStatus;
  bool? isActive;
  String? status;

  factory MyAdvertiserData.fromJson(Map<String, dynamic> json) =>
      MyAdvertiserData(
        id: json["id"],
        tagsList: json["tagsList"] == null
            ? null
            : List<String>.from(json["tagsList"].map((x) => x)),
        itemsList: json["itemsList"] == null
            ? null
            : List<String>.from(json["itemsList"].map((x) => x)),
        title: json["title"],
        location: json["location"],
        street: json["street"],
        province: json["province"],
        postalCode: json["postal_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        description: json["description"],
        callAction: json["call_action"],
        advViewCount: json["advViewCount"],
        advClickCount: json["advClickCount"],
        urlLink: json["url_link"],
        amount: json["amount"],
        currency: json["currency"],
        adminStatus: json["admin_status"],
        isActive: json["isActive"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tagsList": tagsList == null
            ? null
            : List<dynamic>.from(tagsList!.map((x) => x)),
        "itemsList": itemsList == null
            ? null
            : List<dynamic>.from(itemsList!.map((x) => x)),
        "title": title,
        "location": location,
        "street": street,
        "province": province,
        "postal_code": postalCode,
        "date": date == null ? null : date!.toIso8601String(),
        "start_date": startDate == null ? null : startDate!.toIso8601String(),
        "end_date": endDate == null ? null : endDate!.toIso8601String(),
        "description": description,
        "call_action": callAction,
        "advViewCount": advViewCount,
        "advClickCount": advClickCount,
        "url_link": urlLink,
        "amount": amount,
        "currency": currency,
        "admin_status": adminStatus,
        "isActive": isActive,
        "status": status,
      };
}
