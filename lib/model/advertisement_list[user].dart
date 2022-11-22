// To parse this JSON data, do
//
//     final advertisementListUserModel = advertisementListUserModelFromJson(jsonString?);

import 'dart:convert';

AdvertisementListUserModel advertisementListUserModelFromJson(String? str) =>
    AdvertisementListUserModel.fromJson(json.decode(str!));

String? advertisementListUserModelToJson(AdvertisementListUserModel data) =>
    json.encode(data.toJson());

class AdvertisementListUserModel {
  AdvertisementListUserModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory AdvertisementListUserModel.fromJson(Map<String?, dynamic> json) =>
      AdvertisementListUserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userDetails,
    this.tagsList,
    this.itemsList,
    this.title,
    this.location,
    this.street,
    this.province,
    this.postalCode,
    this.date,
    this.startDate,
    this.endDate,
    this.description,
    this.callAction,
    this.advViewCount,
    this.advClickCount,
    this.urlLink,
    this.amount,
    this.currency,
    this.adminStatus,
    this.isActive,
    this.status,
  });

  int? id;
  UserDetails? userDetails;
  List<String>? tagsList;
  List<dynamic>? itemsList;
  String? title;
  String? location;
  String? street;
  String? province;
  String? postalCode;
  DateTime? date;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? callAction;
  int? advViewCount;
  int? advClickCount;
  String? urlLink;
  String? amount;
  String? currency;
  String? adminStatus;
  bool? isActive;
  String? status;

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"],
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromJson(json["userDetails"]),
        tagsList: json["tagsList"] == null
            ? null
            : List<String>.from(json["tagsList"].map((x) => x)),
        itemsList: json["itemsList"] == null
            ? null
            : List<dynamic>.from(json["itemsList"].map((x) => x)),
        title: json["title"],
        location: json["location"],
        street: json["street"],
        province: json["province"],
        postalCode: json["postal_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        description: json["description"],
        callAction: json["call_action"],
        advViewCount: json["advViewCount"],
        advClickCount: json["advClickCount"],
        urlLink: json["url_link"],
        amount: json["amount"],
        currency: json["currency"],
        adminStatus: json["admin_status"],
        isActive: json["isActive"],
        status: json["status"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userDetails": userDetails == null ? null : userDetails!.toJson(),
        "tagsList": tagsList == null
            ? null
            : List<dynamic>.from(tagsList!.map((x) => x)),
        "itemsList": itemsList == null
            ? null
            : List<dynamic>.from(itemsList!.map((x) => x)),
        "title": title,
        "location": location,
        "street": street,
        "province": province,
        "postal_code": postalCode,
        "date": date == null ? null : date!.toIso8601String(),
        "start_date": startDate == null ? null : startDate!.toIso8601String(),
        "end_date": endDate == null ? null : endDate!.toIso8601String(),
        "description": description,
        "call_action": callAction,
        "advViewCount": advViewCount,
        "advClickCount": advClickCount,
        "url_link": urlLink,
        "amount": amount,
        "currency": currency,
        "admin_status": adminStatus,
        "isActive": isActive,
        "status": status,
      };
}

class UserDetails {
  UserDetails({
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
    this.profileImage,
    this.role,
    this.status,
    this.onlineStatus,
    this.latitude,
    this.longitude,
    this.profession,
    this.companyName,
    this.companyPhoneNumber,
    this.compnayStreetName,
    this.compnayCity,
    this.companyCountry,
    this.compnayIdCountry,
    this.compnayPostalCode,
    this.compnayWebsite,
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
  String? profileImage;
  String? role;
  String? status;
  String? onlineStatus;
  String? latitude;
  String? longitude;
  String? profession;
  String? companyName;
  String? companyPhoneNumber;
  String? compnayStreetName;
  String? compnayCity;
  String? companyCountry;
  dynamic compnayIdCountry;
  String? compnayPostalCode;
  String? compnayWebsite;

  factory UserDetails.fromJson(Map<String?, dynamic> json) => UserDetails(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        country: json["country"],
        idCountry: json["id_country"],
        postalCode: json["postal_code"],
        mobileStatus: json["mobile_status"],
        profileImage: json["profile_image"],
        role: json["role"],
        status: json["status"],
        onlineStatus: json["online_status"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        profession: json["profession"],
        companyName: json["company_name"],
        companyPhoneNumber: json["company_phone_number"],
        compnayStreetName: json["compnay_street_name"],
        compnayCity: json["compnay_city"],
        companyCountry: json["company_country"],
        compnayIdCountry: json["compnay_id_country"],
        compnayPostalCode: json["compnay_postal_code"],
        compnayWebsite: json["compnay_website"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "id_social": idSocial,
        "full_name": fullName,
        "email": email,
        "house_number": houseNumber,
        "street_name": streetName,
        "phone_number": phoneNumber,
        "city": city,
        "country": country,
        "id_country": idCountry,
        "postal_code": postalCode,
        "mobile_status": mobileStatus,
        "profile_image": profileImage,
        "role": role,
        "status": status,
        "online_status": onlineStatus,
        "latitude": latitude,
        "longitude": longitude,
        "profession": profession,
        "company_name": companyName,
        "company_phone_number": companyPhoneNumber,
        "compnay_street_name": compnayStreetName,
        "compnay_city": compnayCity,
        "company_country": companyCountry,
        "compnay_id_country": compnayIdCountry,
        "compnay_postal_code": compnayPostalCode,
        "compnay_website": compnayWebsite,
      };
}
