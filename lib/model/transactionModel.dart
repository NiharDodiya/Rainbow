// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString?);

import 'dart:convert';

TransactionModel transactionModelFromJson(String? str) =>
    TransactionModel.fromJson(json.decode(str!));

String? transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.status,
    this.message,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.userDetail,
    this.data,
  });

  bool? status;
  String? message;
  int? cuurentPage;
  int? totalPage;
  int? count;
  UserDetail? userDetail;
  List<Datum>? data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        status: json["status"],
        message: json["message"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        userDetail: json["userDetail"] == null
            ? null
            : UserDetail.fromJson(json["userDetail"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "userDetail": userDetail == null ? null : userDetail!.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.idUser,
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
  String? transactionId;
  double? amount;
  String? currency;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idUser: json["id_user"],
        transactionId: json["transaction_id"],
        // ignore: prefer_null_aware_operators
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        currency: json["currency"],
        type: json["type"],
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
        "id_user": idUser,
        "transaction_id": transactionId,
        "amount": amount,
        "currency": currency,
        "type": type,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class UserDetail {
  UserDetail({
    this.id,
    this.idSocial,
    this.fullName,
    this.email,
    this.address1,
    this.address2,
    this.phoneNumber,
    this.maritalStatus,
    this.onlineStatus,
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.mobileStatus,
    this.role,
    this.referrallCode,
    this.idStatus,
    this.latitude,
    this.longitude,
    this.userType,
    this.selfiStatus,
    this.userStatus,
    this.age,
    this.city,
    this.height,
    this.weight,
    this.instagram,
    this.youtube,
    this.facebook,
    this.twitter,
    this.about,
    this.idCardPrimary,
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
  });

  int? id;
  String? idSocial;
  String? fullName;
  String? email;
  String? address1;
  String? address2;
  String? phoneNumber;
  String? maritalStatus;
  String? onlineStatus;
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? mobileStatus;
  String? role;
  String? referrallCode;
  String? idStatus;
  String? latitude;
  String? longitude;
  String? userType;
  String? selfiStatus;
  String? userStatus;
  int? age;
  String? city;
  String? height;
  String? weight;
  String? instagram;
  String? youtube;
  String? facebook;
  String? twitter;
  String? about;
  int? idCardPrimary;
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory UserDetail.fromJson(Map<String?, dynamic> json) => UserDetail(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        onlineStatus: json["online_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus: json["mobile_status"],
        role: json["role"],
        referrallCode: json["referrall_code"],
        idStatus: json["id_status"],
        latitude: json["latitude"].toString().isEmpty
            ? null
            : json["latitude"] is String
                ? double.parse(json["latitude"]).toString()
                : json["latitude"].toString(),
        longitude: json["longitude"].toString().isEmpty
            ? null
            : json["longitude"] is String
                ? double.parse(json["longitude"]).toString()
                : json["longitude"].toString(),
        userType: json["user_type"],
        selfiStatus: json["selfi_status"],
        userStatus: json["user_status"],
        age: json["age"],
        city: json["city"],
        height: json["height"],
        weight: json["weight"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        about: json["about"],
        idCardPrimary: json["id_card_primary"],
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage: json["background_image"],
        profileImage: json["profile_image"],
        status: json["status"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "id_social": idSocial,
        "full_name": fullName,
        "email": email,
        "address1": address1,
        "address2": address2,
        "phone_number": phoneNumber,
        "marital_status": maritalStatus,
        "online_status": onlineStatus,
        "id_ethnicity": idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "mobile_status": mobileStatus,
        "role": role,
        "referrall_code": referrallCode,
        "id_status": idStatus,
        "latitude": latitude,
        "longitude": longitude,
        "user_type": userType,
        "selfi_status": selfiStatus,
        "user_status": userStatus,
        "age": age,
        "city": city,
        "height": height,
        "weight": weight,
        "instagram": instagram,
        "youtube": youtube,
        "facebook": facebook,
        "twitter": twitter,
        "about": about,
        "id_card_primary": idCardPrimary,
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}
