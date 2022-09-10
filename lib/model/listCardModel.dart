// To parse this JSON data, do
//
//     final listCardModel = listCardModelFromJson(jsonString?);

import 'dart:convert';

ListCardModel listCardModelFromJson(String? str) => ListCardModel.fromJson(json.decode(str!));

String? listCardModelToJson(ListCardModel data) => json.encode(data.toJson());

class ListCardModel {
  ListCardModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory ListCardModel.fromJson(Map<String?, dynamic> json) => ListCardModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String?, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.cardNumber,
    this.cardType,
    this.cardBrand,
    this.expMonth,
    this.expYear,
    this.cardHolder,
    this.status,
    this.isPrimary,
  });

  int? id;
  String? cardNumber;
  String? cardType;
  String? cardBrand;
  int? expMonth;
  int? expYear;
  String? cardHolder;
  String? status;
  bool? isPrimary;

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    cardNumber: json["card_number"] == null ? null : json["card_number"],
    cardType: json["card_type"] == null ? null : json["card_type"],
    cardBrand: json["card_brand"] == null ? null : json["card_brand"],
    expMonth: json["exp_month"] == null ? null : json["exp_month"],
    expYear: json["exp_year"] == null ? null : json["exp_year"],
    cardHolder: json["card_holder"] == null ? null : json["card_holder"],
    status: json["status"] == null ? null : json["status"],
    isPrimary: json["isPrimary"] == null ? null : json["isPrimary"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id == null ? null : id,
    "card_number": cardNumber == null ? null : cardNumber,
    "card_type": cardType == null ? null : cardType,
    "card_brand": cardBrand == null ? null : cardBrand,
    "exp_month": expMonth == null ? null : expMonth,
    "exp_year": expYear == null ? null : expYear,
    "card_holder": cardHolder == null ? null : cardHolder,
    "status": status == null ? null : status,
    "isPrimary": isPrimary == null ? null : isPrimary,
  };
}
