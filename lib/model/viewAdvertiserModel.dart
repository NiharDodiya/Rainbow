// To parse this JSON data, do
//
//     final viewAdvertiserModel = viewAdvertiserModelFromJson(jsonString);

import 'dart:convert';

ViewAdvertiserModel viewAdvertiserModelFromJson(String? str) =>
    ViewAdvertiserModel.fromJson(json.decode(str!));

String? viewAdvertiserModelToJson(ViewAdvertiserModel data) =>
    json.encode(data.toJson());

class ViewAdvertiserModel {
  ViewAdvertiserModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory ViewAdvertiserModel.fromJson(Map<String, dynamic> json) =>
      ViewAdvertiserModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.idSocial,
    this.fullName,
    this.email,
    this.houseNumber,
    this.streetName,
    this.phoneNumber,
    this.city,
    this.country,
    this.idCountry,
    this.postalCode,
    this.mobileStatus,
    this.onlineStatus,
    this.profileImage,
    this.role,
    this.status,
    this.profession,
    this.companyName,
    this.companyPhoneNumber,
    this.compnayStreetName,
    this.compnayCity,
    this.companyCountry,
    this.compnayIdCountry,
    this.compnayPostalCode,
    this.compnayWebsite,
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

  int? id;
  String? idSocial;
  String? fullName;
  String? email;
  String? houseNumber;
  String? streetName;
  String? phoneNumber;
  String? city;
  String? country;
  int? idCountry;
  String? postalCode;
  String? mobileStatus;
  String? onlineStatus;
  String? profileImage;
  String? role;
  String? status;
  String? profession;
  String? companyName;
  String? companyPhoneNumber;
  String? compnayStreetName;
  String? compnayCity;
  String? companyCountry;
  int? compnayIdCountry;
  String? compnayPostalCode;
  String? compnayWebsite;
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
  List<dynamic>? userView;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        idSocial: json["id_social"] == null ? null : json["id_social"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        houseNumber: json["house_number"] == null ? null : json["house_number"],
        streetName: json["street_name"] == null ? null : json["street_name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        idCountry: json["id_country"] == null ? null : json["id_country"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        onlineStatus:
            json["online_status"] == null ? null : json["online_status"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        role: json["role"] == null ? null : json["role"],
        status: json["status"] == null ? null : json["status"],
        profession: json["profession"] == null ? null : json["profession"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        companyPhoneNumber: json["company_phone_number"] == null
            ? null
            : json["company_phone_number"],
        compnayStreetName: json["compnay_street_name"] == null
            ? null
            : json["compnay_street_name"],
        compnayCity: json["compnay_city"] == null ? null : json["compnay_city"],
        companyCountry:
            json["company_country"] == null ? null : json["company_country"],
        compnayIdCountry: json["compnay_id_country"] == null
            ? null
            : json["compnay_id_country"],
        compnayPostalCode: json["compnay_postal_code"] == null
            ? null
            : json["compnay_postal_code"],
        compnayWebsite:
            json["compnay_website"] == null ? null : json["compnay_website"],
        profilePhoto:
            json["profile_photo"] == null ? null : json["profile_photo"],
        basicInfo: json["basic_info"] == null ? null : json["basic_info"],
        socialMedia: json["social_media"] == null ? null : json["social_media"],
        aboutMe: json["about_me"] == null ? null : json["about_me"],
        hobbiesInterest:
            json["hobbies_interest"] == null ? null : json["hobbies_interest"],
        testimonials:
            json["testimonials"] == null ? null : json["testimonials"],
        visitors: json["visitors"] == null ? null : json["visitors"],
        isFriends: json["isFriends"] == null ? null : json["isFriends"],
        isBlock: json["isBlock"] == null ? null : json["isBlock"],
        testimonialsList: json["testimonialsList"] == null
            ? null
            : List<dynamic>.from(json["testimonialsList"].map((x) => x)),
        userView: json["userView"] == null
            ? null
            : List<dynamic>.from(json["userView"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_social": idSocial == null ? null : idSocial,
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "house_number": houseNumber == null ? null : houseNumber,
        "street_name": streetName == null ? null : streetName,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "id_country": idCountry == null ? null : idCountry,
        "postal_code": postalCode == null ? null : postalCode,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "online_status": onlineStatus == null ? null : onlineStatus,
        "profile_image": profileImage == null ? null : profileImage,
        "role": role == null ? null : role,
        "status": status == null ? null : status,
        "profession": profession == null ? null : profession,
        "company_name": companyName == null ? null : companyName,
        "company_phone_number":
            companyPhoneNumber == null ? null : companyPhoneNumber,
        "compnay_street_name":
            compnayStreetName == null ? null : compnayStreetName,
        "compnay_city": compnayCity == null ? null : compnayCity,
        "company_country": companyCountry == null ? null : companyCountry,
        "compnay_id_country":
            compnayIdCountry == null ? null : compnayIdCountry,
        "compnay_postal_code":
            compnayPostalCode == null ? null : compnayPostalCode,
        "compnay_website": compnayWebsite == null ? null : compnayWebsite,
        "profile_photo": profilePhoto == null ? null : profilePhoto,
        "basic_info": basicInfo == null ? null : basicInfo,
        "social_media": socialMedia == null ? null : socialMedia,
        "about_me": aboutMe == null ? null : aboutMe,
        "hobbies_interest": hobbiesInterest == null ? null : hobbiesInterest,
        "testimonials": testimonials == null ? null : testimonials,
        "visitors": visitors == null ? null : visitors,
        "isFriends": isFriends == null ? null : isFriends,
        "isBlock": isBlock == null ? null : isBlock,
        "testimonialsList": testimonialsList == null
            ? null
            : List<dynamic>.from(testimonialsList!.map((x) => x)),
        "userView": userView == null
            ? null
            : List<dynamic>.from(userView!.map((x) => x)),
      };
}
