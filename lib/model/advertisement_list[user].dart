// To parse this JSON data, do
//
//     final advertisementListUserModel = advertisementListUserModelFromJson(jsonString?);

import 'dart:convert';

AdvertisementListUserModel advertisementListUserModelFromJson(String? str) => AdvertisementListUserModel.fromJson(json.decode(str!));

String? advertisementListUserModelToJson(AdvertisementListUserModel data) => json.encode(data.toJson());

class AdvertisementListUserModel {
  AdvertisementListUserModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory AdvertisementListUserModel.fromJson(Map<String?, dynamic> json) => AdvertisementListUserModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String?, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    id: json["id"] == null ? null : json["id"],
    userDetails: json["userDetails"] == null ? null : UserDetails.fromJson(json["userDetails"]),
    tagsList: json["tagsList"] == null ? null : List<String>.from(json["tagsList"].map((x) => x)),
    itemsList: json["itemsList"] == null ? null : List<dynamic>.from(json["itemsList"].map((x) => x)),
    title: json["title"] == null ? null : json["title"],
    location: json["location"] == null ? null : json["location"],
    street: json["street"] == null ? null : json["street"],
    province: json["province"] == null ? null : json["province"],
    postalCode: json["postal_code"] == null ? null : json["postal_code"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    description: json["description"] == null ? null : json["description"],
    callAction: json["call_action"] == null ? null : json["call_action"],
    advViewCount: json["advViewCount"] == null ? null : json["advViewCount"],
    advClickCount: json["advClickCount"] == null ? null : json["advClickCount"],
    urlLink: json["url_link"] == null ? null : json["url_link"],
    amount: json["amount"] == null ? null : json["amount"],
    currency: json["currency"] == null ? null : json["currency"],
    adminStatus: json["admin_status"] == null ? null : json["admin_status"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id == null ? null : id,
    "userDetails": userDetails == null ? null : userDetails!.toJson(),
    "tagsList": tagsList == null ? null : List<dynamic>.from(tagsList!.map((x) => x)),
    "itemsList": itemsList == null ? null : List<dynamic>.from(itemsList!.map((x) => x)),
    "title": title == null ? null : title,
    "location": location == null ? null : location,
    "street": street == null ? null : street,
    "province": province == null ? null : province,
    "postal_code": postalCode == null ? null : postalCode,
    "date": date == null ? null : date!.toIso8601String(),
    "start_date": startDate == null ? null : startDate!.toIso8601String(),
    "end_date": endDate == null ? null : endDate!.toIso8601String(),
    "description": description == null ? null : description,
    "call_action": callAction == null ? null : callAction,
    "advViewCount": advViewCount == null ? null : advViewCount,
    "advClickCount": advClickCount == null ? null : advClickCount,
    "url_link": urlLink == null ? null : urlLink,
    "amount": amount == null ? null : amount,
    "currency": currency == null ? null : currency,
    "admin_status": adminStatus == null ? null : adminStatus,
    "isActive": isActive == null ? null : isActive,
    "status": status == null ? null : status,
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
  int? compnayIdCountry;
  String? compnayPostalCode;
  String? compnayWebsite;

  factory UserDetails.fromJson(Map<String?, dynamic> json) => UserDetails(
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
    mobileStatus: json["mobile_status"] == null ? null : json["mobile_status"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
    role: json["role"] == null ? null : json["role"],
    status: json["status"] == null ? null : json["status"],
    onlineStatus: json["online_status"] == null ? null : json["online_status"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    profession: json["profession"] == null ? null : json["profession"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    companyPhoneNumber: json["company_phone_number"] == null ? null : json["company_phone_number"],
    compnayStreetName: json["compnay_street_name"] == null ? null : json["compnay_street_name"],
    compnayCity: json["compnay_city"] == null ? null : json["compnay_city"],
    companyCountry: json["company_country"] == null ? null : json["company_country"],
    compnayIdCountry: json["compnay_id_country"] == null ? null : json["compnay_id_country"],
    compnayPostalCode: json["compnay_postal_code"] == null ? null : json["compnay_postal_code"],
    compnayWebsite: json["compnay_website"] == null ? null : json["compnay_website"],
  );

  Map<String?, dynamic> toJson() => {
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
    "profile_image": profileImage == null ? null : profileImage,
    "role": role == null ? null : role,
    "status": status == null ? null : status,
    "online_status": onlineStatus == null ? null : onlineStatus,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "profession": profession == null ? null : profession,
    "company_name": companyName == null ? null : companyName,
    "company_phone_number": companyPhoneNumber == null ? null : companyPhoneNumber,
    "compnay_street_name": compnayStreetName == null ? null : compnayStreetName,
    "compnay_city": compnayCity == null ? null : compnayCity,
    "company_country": companyCountry == null ? null : companyCountry,
    "compnay_id_country": compnayIdCountry == null ? null : compnayIdCountry,
    "compnay_postal_code": compnayPostalCode == null ? null : compnayPostalCode,
    "compnay_website": compnayWebsite == null ? null : compnayWebsite,
  };
}
