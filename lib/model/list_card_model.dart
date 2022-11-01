// To parse this JSON data, do
//
//     final listCardModel = listCardModelFromJson(jsonString?);

import 'dart:convert';

ListCardModel listCardModelFromJson(String? str) =>
    ListCardModel.fromJson(json.decode(str!));

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
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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
        id: json["id"],
        cardNumber: json["card_number"],
        cardType: json["card_type"],
        cardBrand: json["card_brand"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        cardHolder: json["card_holder"],
        status: json["status"],
        isPrimary: json["isPrimary"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "card_number": cardNumber,
        "card_type": cardType,
        "card_brand": cardBrand,
        "exp_month": expMonth,
        "exp_year": expYear,
        "card_holder": cardHolder,
        "status": status,
        "isPrimary": isPrimary,
      };
}
