// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  ProfileData? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class ProfileData {
  ProfileData({
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
    this.aboutMe,
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
    this.profilePhoto,
    this.basicInfo,
    this.socialMedia,
    this.hobbiesInterest,
    this.testimonials,
    this.isFriends,
    this.isBlock,
    this.visitors,
    this.userView,
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
  bool? aboutMe;
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;
  bool? profilePhoto;
  bool? basicInfo;
  bool? socialMedia;
  bool? hobbiesInterest;
  bool? testimonials;
  String? isFriends;
  String? isBlock;
  bool? visitors;
  List<dynamic>? userView;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
        aboutMe: json["about_me"],
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage: json["background_image"],
        profileImage: json["profile_image"],
        status: json["status"],
        profilePhoto: json["profile_photo"],
        basicInfo: json["basic_info"],
        socialMedia: json["social_media"],
        hobbiesInterest: json["hobbies_interest"],
        testimonials: json["testimonials"],
        isFriends: json["isFriends"],
        isBlock: json["isBlock"],
        visitors: json["visitors"],
        userView: json["userView"] == null
            ? null
            : List<dynamic>.from(json["userView"].map((x) => x)),
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
        "about_me": aboutMe,
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
        "profile_photo": profilePhoto,
        "basic_info": basicInfo,
        "social_media": socialMedia,
        "hobbies_interest": hobbiesInterest,
        "testimonials": testimonials,
        "isFriends": isFriends,
        "isBlock": isBlock,
        "visitors": visitors,
        "userView": userView == null
            ? null
            : List<dynamic>.from(userView!.map((x) => x)),
      };
}
