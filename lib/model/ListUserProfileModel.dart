// To parse this JSON data, do
//
//     final listUseProfileModel = listUseProfileModelFromJson(jsonString);

import 'dart:convert';

ListUseProfileModel listUseProfileModelFromJson(String? str) =>
    ListUseProfileModel.fromJson(json.decode(str!));

String? listUseProfileModelToJson(ListUseProfileModel data) =>
    json.encode(data.toJson());

class ListUseProfileModel {
  ListUseProfileModel({
    this.status,
    this.message,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.data,
  });

  bool? status;
  String? message;
  int? cuurentPage;
  int? totalPage;
  int? count;
  List<ListUserData>? data;

  factory ListUseProfileModel.fromJson(Map<String, dynamic> json) =>
      ListUseProfileModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        cuurentPage: json["cuurentPage"] == null ? null : json["cuurentPage"],
        totalPage: json["totalPage"] == null ? null : json["totalPage"],
        count: json["count"] == null ? null : json["count"],
        data: json["data"] == null
            ? null
            : List<ListUserData>.from(
                json["data"].map((x) => ListUserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "cuurentPage": cuurentPage == null ? null : cuurentPage,
        "totalPage": totalPage == null ? null : totalPage,
        "count": count == null ? null : count,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ListUserData {
  ListUserData({
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
    this.hobbiesAndInterest,
    this.backgroundImage,
    this.profileImage,
    this.status,
    this.isFriends,
    this.isBlock,
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
  double? latitude;
  double? longitude;
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
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;
  String? isFriends;
  String? isBlock;

  factory ListUserData.fromJson(Map<String, dynamic> json) => ListUserData(
        id: json["id"] == null ? null : json["id"],
        idSocial: json["id_social"] == null ? null : json["id_social"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        onlineStatus:
            json["online_status"] == null ? null : json["online_status"],
        idEthnicity: json["id_ethnicity"] == null ? null : json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"] == null ? null : json["no_kids"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        role: json["role"] == null ? null : json["role"],
        referrallCode:
            json["referrall_code"] == null ? null : json["referrall_code"],
        idStatus: json["id_status"] == null ? null : json["id_status"],
        latitude: json["latitude"].toString().isEmpty
            ? null
            : json["latitude"] is String
                ? double.parse(json["latitude"])
                : json["latitude"],
        longitude: json["longitude"].toString().isEmpty
            ? null
            : json["longitude"] is String
                ? double.parse(json["longitude"])
                : json["latitude"],
        userType: json["user_type"] == null ? null : json["user_type"],
        selfiStatus: json["selfi_status"] == null ? null : json["selfi_status"],
        userStatus: json["user_status"] == null ? null : json["user_status"],
        age: json["age"] == null ? null : json["age"],
        city: json["city"] == null ? null : json["city"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        about: json["about"] == null ? null : json["about"],
        hobbiesAndInterest: json["hobbies_and_Interest"] == null
            ? null
            : json["hobbies_and_Interest"],
        backgroundImage:
            json["background_image"] == null ? null : json["background_image"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        status: json["status"] == null ? null : json["status"],
        isFriends: json["isFriends"] == null ? null : json["isFriends"],
        isBlock: json["isBlock"] == null ? null : json["isBlock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_social": idSocial == null ? null : idSocial,
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "online_status": onlineStatus == null ? null : onlineStatus,
        "id_ethnicity": idEthnicity == null ? null : idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids == null ? null : noKids,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "role": role == null ? null : role,
        "referrall_code": referrallCode == null ? null : referrallCode,
        "id_status": idStatus == null ? null : idStatus,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "user_type": userType == null ? null : userType,
        "selfi_status": selfiStatus == null ? null : selfiStatus,
        "user_status": userStatus == null ? null : userStatus,
        "age": age == null ? null : age,
        "city": city == null ? null : city,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "about": about == null ? null : about,
        "hobbies_and_Interest":
            hobbiesAndInterest == null ? null : hobbiesAndInterest,
        "background_image": backgroundImage == null ? null : backgroundImage,
        "profile_image": profileImage == null ? null : profileImage,
        "status": status == null ? null : status,
        "isFriends": isFriends == null ? null : isFriends,
        "isBlock": isBlock == null ? null : isBlock,
      };
}
