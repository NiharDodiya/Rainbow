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
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<MyAdvertiserData>.from(json["data"].map((x) => MyAdvertiserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
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

  factory MyAdvertiserData.fromJson(Map<String, dynamic> json) => MyAdvertiserData(
        id: json["id"] == null ? null : json["id"],
        tagsList: json["tagsList"] == null
            ? null
            : List<String>.from(json["tagsList"].map((x) => x)),
        itemsList: json["itemsList"] == null
            ? null
            : List<String>.from(json["itemsList"].map((x) => x)),
        title: json["title"] == null ? null : json["title"],
        location: json["location"] == null ? null : json["location"],
        street:
            json["street"] == null ? null : json["street"],
        province: json["province"] == null ? null : json["province"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        description: json["description"] == null ? null : json["description"],
        callAction: json["call_action"] == null
            ? null
            :json["call_action"],
        advViewCount:
            json["advViewCount"] == null ? null : json["advViewCount"],
        advClickCount:
            json["advClickCount"] == null ? null : json["advClickCount"],
        urlLink: json["url_link"] == null ? null : json["url_link"],
        amount: json["amount"],
        currency: json["currency"],
        adminStatus: json["admin_status"] == null
            ? null
            : json["admin_status"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        status:
            json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tagsList": tagsList == null
            ? null
            : List<dynamic>.from(tagsList!.map((x) => x)),
        "itemsList": itemsList == null
            ? null
            : List<dynamic>.from(itemsList!.map((x) => x)),
        "title": title == null ? null : title,
        "location": location == null ? null : location,
        "street": street == null ? null : street,
        "province": province == null ? null : province,
        "postal_code": postalCode == null ? null : postalCode,
        "date": date == null ? null : date!.toIso8601String(),
        "start_date": startDate == null ? null : startDate!.toIso8601String(),
        "end_date": endDate == null ? null : endDate!.toIso8601String(),
        "description": description == null ? null : description,
        "call_action":
            callAction == null ? null : callAction,
        "advViewCount": advViewCount == null ? null : advViewCount,
        "advClickCount": advClickCount == null ? null : advClickCount,
        "url_link": urlLink == null ? null : urlLink,
        "amount": amount,
        "currency": currency,
        "admin_status":
            adminStatus == null ? null : adminStatus,
        "isActive": isActive == null ? null : isActive,
        "status": status == null ? null : status,
      };
}
