// To parse this JSON data, do
//
//     final companyRegister = companyRegisterFromJson(jsonString);

import 'dart:convert';

CompanyRegister companyRegisterFromJson(String? str) =>
    CompanyRegister.fromJson(json.decode(str!));

String? companyRegisterToJson(CompanyRegister data) =>
    json.encode(data.toJson());

class CompanyRegister {
  CompanyRegister({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory CompanyRegister.fromJson(Map<String, dynamic> json) =>
      CompanyRegister(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.city,
    this.country,
    this.idCountry,
    this.role,
    this.personalStatus,
    this.companyStatus,
    this.status,
  });

  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? city;
  String? country;
  int? idCountry;
  String? role;
  String? personalStatus;
  String? companyStatus;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        country: json["country"],
        idCountry: json["id_country"],
        role: json["role"],
        personalStatus: json["personal_status"],
        companyStatus: json["company_status"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "city": city,
        "country": country,
        "id_country": idCountry,
        "role": role,
        "personal_status": personalStatus,
        "company_status": companyStatus,
        "status": status,
      };
}
