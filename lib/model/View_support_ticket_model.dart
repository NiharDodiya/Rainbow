import 'dart:convert';

ViewSupportTicketModel viewSupportTicketModelFromJson(String? str) =>
    ViewSupportTicketModel.fromJson(json.decode(str!));

String? viewSupportTicketModelToJson(ViewSupportTicketModel data) =>
    json.encode(data.toJson());

class ViewSupportTicketModel {
  ViewSupportTicketModel({
    this.status,
    this.message,
    this.cuurentPage,
    this.totalPage,
    this.count,
    this.idUser,
    this.data,
  });

  bool? status;
  String? message;
  int? cuurentPage;
  int? totalPage;
  int? count;
  int? idUser;
  List<Data>? data;

  factory ViewSupportTicketModel.fromJson(Map<String, dynamic> json) =>
      ViewSupportTicketModel(
        status: json["status"],
        message: json["message"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        idUser: json["id_user"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "id_user": idUser,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.idSender,
    this.description,
    this.itmeList,
    this.createdAt,
    this.updatedAt,
    this.userDetail,
  });

  int? id;
  int? idSender;
  String? description;
  List<ItmeList>? itmeList;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserDetail? userDetail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idSender: json["id_sender"],
        description: json["description"],
        itmeList: json["itmeList"] == null
            ? null
            : List<ItmeList>.from(
                json["itmeList"].map((x) => ItmeList.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userDetail: json["userDetail"] == null
            ? null
            : UserDetail.fromJson(json["userDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_sender": idSender,
        "description": description,
        "itmeList": itmeList == null
            ? null
            : List<dynamic>.from(itmeList!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "userDetail": userDetail == null ? null : userDetail!.toJson(),
      };
}

class ItmeList {
  ItmeList({
    this.image,
    this.type,
  });

  String? image;
  dynamic type;

  factory ItmeList.fromJson(Map<String, dynamic> json) => ItmeList(
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "type": type,
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
  int? idCardPrimary;
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
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
        referrallCode:
            json["referrall_code"] == null ? "" : json["referrall_code"],
        idStatus: json["id_status"],
        latitude: json["latitude"].toString().isEmpty
            ? null
            : json["latitude"] is String
                ? double.parse(json["latitude"])
                : json["latitude"],
        longitude: json["longitude"].toString().isEmpty
            ? null
            : json["longitude"] is String
                ? double.parse(json["longitude"])
                : json["longitude"],
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
        idCardPrimary:
            json["id_card_primary"] == null ? null : json["id_card_primary"],
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
