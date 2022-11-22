// To parse this JSON data, do
//
//     final PaymentAdvertiseModel = PaymentAdvertiseModelFromJson(jsonString?);

import 'dart:convert';

PaymentAdvertiseModel paymentAdvertiseModelFromJson(String? str) => PaymentAdvertiseModel.fromJson(json.decode(str!));

String? paymentAdvertiseModelToJson(PaymentAdvertiseModel data) => json.encode(data.toJson());

class PaymentAdvertiseModel {
  PaymentAdvertiseModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory PaymentAdvertiseModel.fromJson(Map<String?, dynamic> json) => PaymentAdvertiseModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String?, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.idUser,
    this.idAdvertisement,
    this.transactionId,
    this.amount,
    this.currency,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idUser;
  int? idAdvertisement;
  String? transactionId;
  String? amount;
  String? currency;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
    id: json["id"],
    idUser: json["id_user"],
    idAdvertisement: json["id_advertisement"],
    transactionId: json["transaction_id"],
    amount: json["amount"],
    currency: json["currency"],
    type: json["type"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "id_advertisement": idAdvertisement,
    "transaction_id": transactionId,
    "amount": amount,
    "currency": currency,
    "type": type,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
