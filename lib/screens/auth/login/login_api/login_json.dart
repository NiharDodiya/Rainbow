// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString?);

import 'dart:convert';

LoginModel loginModelFromJson(String? str) => LoginModel.fromJson(json.decode(str!));

String? loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  bool?status;
  String? message;
  String? token;
  Data? data;

  factory LoginModel.fromJson(Map<String?, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String?, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
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
    this.status,
  });

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
  String? status;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
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
    status: json["status"],
  );

  Map<String?, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "address1": address1,
    "address2": address2,
    "phone_number": phoneNumber,
    "marital_status": maritalStatus,
    "id_ethnicity": idEthnicity,
    "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
    "no_kids": noKids,
    "role": role,
    "status": status,
  };
}
