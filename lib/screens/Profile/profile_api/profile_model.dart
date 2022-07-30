// To parse this JSON data, do
//
//     final viewProfile = viewProfileFromJson(jsonString);

import 'dart:convert';

ViewProfile viewProfileFromJson(String? str) =>
    ViewProfile.fromJson(json.decode(str!));

String? viewProfileToJson(ViewProfile data) => json.encode(data.toJson());

class ViewProfile {
  ViewProfile({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory ViewProfile.fromJson(Map<String, dynamic> json) => ViewProfile(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
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
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
    this.profilePhoto,
    this.basicInfo,
    this.socialMedia,
    this.aboutMe,
    this.hobbiesInterest,
    this.testimonials,
    this.visitors,
    this.isFriends,
    this.isBlock,
    this.testimonialsList,
    this.userView,
  });

  int?id;
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
  int?noKids;
  String? mobileStatus;
  String? role;
  dynamic referrallCode;
  String? idStatus;
  dynamic userType;
  String? selfiStatus;
  String? userStatus;
  int?age;
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
  bool? profilePhoto;
  bool? basicInfo;
  bool? socialMedia;
  bool? aboutMe;
  bool? hobbiesInterest;
  bool? testimonials;
  bool? visitors;
  String? isFriends;
  String? isBlock;
  List<dynamic>? testimonialsList;
  List<UserView>? userView;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus:
            json["marital_status"],
        onlineStatus:
            json["online_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus:
            json["mobile_status"],
        role: json["role"],
        referrallCode: json["referrall_code"],
        idStatus: json["id_status"],
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
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage:
            json["background_image"],
        profileImage:
            json["profile_image"],
        status: json["status"],
        profilePhoto:
            json["profile_photo"],
        basicInfo: json["basic_info"],
        socialMedia: json["social_media"],
        aboutMe: json["about_me"],
        hobbiesInterest:
            json["hobbies_interest"],
        testimonials:
            json["testimonials"],
        visitors: json["visitors"],
        isFriends: json["isFriends"],
        isBlock: json["isBlock"],
        testimonialsList: json["testimonialsList"] == null
            ? null
            : List<dynamic>.from(json["testimonialsList"].map((x) => x)),
        userView: json["userView"] == null
            ? null
            : List<UserView>.from(
                json["userView"].map((x) => UserView.fromJson(x))),
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
        "hobbies_and_Interest":
            hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
        "profile_photo": profilePhoto,
        "basic_info": basicInfo,
        "social_media": socialMedia,
        "about_me": aboutMe,
        "hobbies_interest": hobbiesInterest,
        "testimonials": testimonials,
        "visitors": visitors,
        "isFriends": isFriends,
        "isBlock": isBlock,
        "testimonialsList": testimonialsList == null
            ? null
            : List<dynamic>.from(testimonialsList!.map((x) => x)),
        "userView": userView == null
            ? null
            : List<dynamic>.from(userView!.map((x) => x.toJson())),
      };
}

class UserView {
  UserView({
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
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
  });

  int?id;
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
  int?noKids;
  String? mobileStatus;
  String? role;
  dynamic referrallCode;
  String? idStatus;
  dynamic userType;
  String? selfiStatus;
  String? userStatus;
  int?age;
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

  factory UserView.fromJson(Map<String, dynamic> json) => UserView(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus:
            json["marital_status"],
        onlineStatus:
            json["online_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus:
            json["mobile_status"],
        role: json["role"],
        referrallCode: json["referrall_code"],
        idStatus: json["id_status"],
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
        hobbiesAndInterest: json["hobbies_and_Interest"],
        backgroundImage:
            json["background_image"],
        profileImage:
            json["profile_image"],
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
        "hobbies_and_Interest":
            hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}
