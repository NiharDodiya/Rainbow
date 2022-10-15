// To parse this JSON data, do
//
//     final viewCardModel = viewCardModelFromJson(jsonString?);

import 'dart:convert';

ViewCardModel viewCardModelFromJson(String? str) =>
    ViewCardModel.fromJson(json.decode(str!));

String? viewCardModelToJson(ViewCardModel data) => json.encode(data.toJson());

class ViewCardModel {
  ViewCardModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory ViewCardModel.fromJson(Map<String?, dynamic> json) => ViewCardModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.idUser,
    this.cardId,
    this.tokenId,
    this.cardNumber,
    this.cardType,
    this.cardBrand,
    this.expMonth,
    this.expYear,
    this.cardHolder,
    this.cardCountry,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.cardAddress,
  });

  int? id;
  int? idUser;
  String? cardId;
  String? tokenId;
  String? cardNumber;
  String? cardType;
  String? cardBrand;
  int? expMonth;
  int? expYear;
  String? cardHolder;
  String? cardCountry;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CardAddress>? cardAddress;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        idUser: json["id_user"],
        cardId: json["card_id"],
        tokenId: json["token_id"],
        cardNumber: json["card_number"],
        cardType: json["card_type"],
        cardBrand: json["card_brand"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        cardHolder: json["card_holder"],
        cardCountry: json["card_country"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        cardAddress: json["cardAddress"] == null
            ? null
            : List<CardAddress>.from(
                json["cardAddress"].map((x) => CardAddress.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "card_id": cardId,
        "token_id": tokenId,
        "card_number": cardNumber,
        "card_type": cardType,
        "card_brand": cardBrand,
        "exp_month": expMonth,
        "exp_year": expYear,
        "card_holder": cardHolder,
        "card_country": cardCountry,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "cardAddress": cardAddress == null
            ? null
            : List<dynamic>.from(cardAddress!.map((x) => x.toJson())),
      };
}

class CardAddress {
  CardAddress({
    this.id,
    this.idCard,
    this.fullName,
    this.address,
    this.city,
    this.postalCode,
    this.country,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idCard;
  String? fullName;
  String? address;
  String? city;
  String? postalCode;
  String? country;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CardAddress.fromJson(Map<String?, dynamic> json) => CardAddress(
        id: json["id"],
        idCard: json["id_card"],
        fullName: json["full_name"],
        address: json["address"],
        city: json["city"],
        postalCode: json["postal_code"],
        country: json["country"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "id_card": idCard,
        "full_name": fullName,
        "address": address,
        "city": city,
        "postal_code": postalCode,
        "country": country,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
