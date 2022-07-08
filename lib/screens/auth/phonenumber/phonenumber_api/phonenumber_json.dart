// To parse this JSON data, do
//
//     final phoneNumber = phoneNumberFromJson(jsonString);

import 'dart:convert';

PhoneNumber phoneNumberFromJson(String? str) =>
    PhoneNumber.fromJson(json.decode(str!));

String? phoneNumberToJson(PhoneNumber data) => json.encode(data.toJson());

class PhoneNumber {
  PhoneNumber({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
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
    this.address1,
    this.address2,
    this.phoneNumber,
    this.maritalStatus,
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.role,
    this.idStatus,
    this.selfiStatus,
    this.status,
  });

  int? id;
  String? fullName;
  String? email;
  String? address1;
  String? address2;
  String? phoneNumber;
  String? maritalStatus;
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? role;
  String? idStatus;
  String? selfiStatus;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        role: json["role"],
        idStatus: json["id_status"],
        selfiStatus: json["selfi_status"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "address1": address1,
        "address2": address2,
        "phone_number": phoneNumber,
        "marital_status": maritalStatus,
        "id_ethnicity": idEthnicity,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "role": role,
        "id_status": idStatus,
        "selfi_status": selfiStatus,
        "status": status,
      };
}
