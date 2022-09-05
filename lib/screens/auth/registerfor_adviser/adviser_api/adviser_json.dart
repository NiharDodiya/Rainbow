// To parse this JSON data, do
//
//     final advertiserRegister = advertiserRegisterFromJson(jsonString);

import 'dart:convert';

AdvertiserRegister advertiserRegisterFromJson(String str) =>
    AdvertiserRegister.fromJson(json.decode(str));

String advertiserRegisterToJson(AdvertiserRegister data) =>
    json.encode(data.toJson());

class AdvertiserRegister {
  AdvertiserRegister({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  bool? status;
  String? message;
  String? token;
  Data? data;

  factory AdvertiserRegister.fromJson(Map<String, dynamic> json) =>
      AdvertiserRegister(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.fullName,
    this.email,
    this.houseNumber,
    this.streetName,
    this.phoneNumber,
    this.city,
    this.country,
    this.idCountry,
    this.postalCode,
    this.role,
    this.status,
    this.companyCountry,
  });

  int? id;
  String? fullName;
  String? email;
  String? houseNumber;
  String? streetName;
  String? phoneNumber;
  String? city;
  String? country;
  int? idCountry;
  String? postalCode;
  String? role;
  String? status;
  String? companyCountry;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        country: json["country"],
        idCountry: json["id_country"],
        postalCode: json["postal_code"],
        role: json["role"],
        status: json["status"],
        companyCountry: json["company_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "house_number": houseNumber,
        "street_name": streetName,
        "phone_number": phoneNumber,
        "city": city,
        "country": country,
        "id_country": idCountry,
        "postal_code": postalCode,
        "role": role,
        "status": status,
        "company_country": companyCountry,
      };
}
