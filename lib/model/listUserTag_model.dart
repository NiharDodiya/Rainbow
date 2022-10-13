// To parse this JSON data, do
//
//     final listUserTagModel = listUserTagModelFromJson(jsonString);

import 'dart:convert';

ListUserTagModel listUserTagModelFromJson(String? str) =>
    ListUserTagModel.fromJson(json.decode(str!));

String? listUserTagModelToJson(ListUserTagModel data) =>
    json.encode(data.toJson());

class ListUserTagModel {
  ListUserTagModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<UserData>? data;

  factory ListUserTagModel.fromJson(Map<String, dynamic> json) =>
      ListUserTagModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<UserData>.from(
                json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserData {
  UserData({
    this.id,
    this.idSocial,
    this.fullName,
    this.email,
    this.address1,
    this.address2,
    this.phoneNumber,
    this.maritalStatus,
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.mobileStatus,
    this.role,
    this.idStatus,
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
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? mobileStatus;
  String? role;
  String? idStatus;
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
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus: json["mobile_status"],
        role: json["role"],
        idStatus: json["id_status"],
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
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage: json["background_image"],
        profileImage: json["profile_image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_social": idSocial,
        "full_name": fullName,
        "email": email,
        "address1": address1,
        "address2": address2,
        "phone_number": phoneNumber,
        "marital_status": maritalStatus,
        "id_ethnicity": idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "mobile_status": mobileStatus,
        "role": role,
        "id_status": idStatus,
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
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}
