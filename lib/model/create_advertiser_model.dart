// To parse this JSON data, do
//
//     final advertisersCreateModel = advertisersCreateModelFromJson(jsonString);

import 'dart:convert';

AdvertisersCreateModel advertisersCreateModelFromJson(String str) => AdvertisersCreateModel.fromJson(json.decode(str));

String advertisersCreateModelToJson(AdvertisersCreateModel data) => json.encode(data.toJson());

class AdvertisersCreateModel {
  AdvertisersCreateModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory AdvertisersCreateModel.fromJson(Map<String, dynamic> json) => AdvertisersCreateModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.createdAt,
    this.updatedAt,
    this.status,
    this.id,
    this.idUser,
    this.idAdvertisement,
    this.transactionId,
    this.amount,
    this.currency,
    this.type,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  int? id;
  int? idUser;
  int? idAdvertisement;
  String? transactionId;
  String? amount;
  String? currency;
  String? type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    status: json["status"],
    id: json["id"],
    idUser: json["id_user"],
    idAdvertisement: json["id_advertisement"],
    transactionId: json["transaction_id"],
    amount: json["amount"],
    currency: json["currency"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "status": status,
    "id": id,
    "id_user": idUser,
    "id_advertisement": idAdvertisement,
    "transaction_id": transactionId,
    "amount": amount,
    "currency": currency,
    "type": type,
  };
}
