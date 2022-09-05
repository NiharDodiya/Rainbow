

import 'dart:convert';

EditAdvertisementModel editAdvertisementModelFromJson(String str) => EditAdvertisementModel.fromJson(json.decode(str));

String editAdvertisementModelToJson(EditAdvertisementModel data) => json.encode(data.toJson());

class EditAdvertisementModel {
  EditAdvertisementModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory EditAdvertisementModel.fromJson(Map<String, dynamic> json) => EditAdvertisementModel(
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
    this.userDetail,
    this.tagsList,
    this.itemsList,
    this.title,
    this.location,
    this.street,
    this.province,
    this.country,
    this.postalCode,
    this.date,
    this.startDate,
    this.endDate,
    this.description,
    this.callAction,
    this.urlLink,
    this.amount,
    this.currency,
    this.advViewCount,
    this.advClickCount,
    this.adminStatus,
    this.isActive,
    this.status,
  });

  int? id;
  UserDetail? userDetail;
  List<String>? tagsList;
  List<String>? itemsList;
  String? title;
  String? location;
  String? street;
  String? province;
  String? country;
  String? postalCode;
  DateTime? date;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? callAction;
  String? urlLink;
  dynamic amount;
  dynamic currency;
  int? advViewCount;
  int? advClickCount;
  String? adminStatus;
  bool? isActive;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    userDetail: json["userDetail"] == null
        ? null
        : UserDetail.fromJson(json["userDetail"]),
    tagsList: json["tagsList"] == null
        ? null
        : List<String>.from(json["tagsList"].map((x) => x)),
    itemsList: json["itemsList"] == null
        ? null
        : List<String>.from(json["itemsList"].map((x) => x)),
    title: json["title"] == null ? null : json["title"],
    location: json["location"] == null ? null : json["location"],
    street: json["street"] == null ? null : json["street"],
    province: json["province"] == null ? null : json["province"],
    country: json["country"] == null ? null : json["country"],
    postalCode: json["postal_code"] == null ? null : json["postal_code"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    startDate: json["start_date"] == null
        ? null
        : DateTime.parse(json["start_date"]),
    endDate:
    json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    description: json["description"] == null ? null : json["description"],
    callAction: json["call_action"] == null ? null : json["call_action"],
    urlLink: json["url_link"] == null ? null : json["url_link"],
    amount: json["amount"],
    currency: json["currency"],
    advViewCount:
    json["advViewCount"] == null ? null : json["advViewCount"],
    advClickCount:
    json["advClickCount"] == null ? null : json["advClickCount"],
    adminStatus: json["admin_status"] == null ? null : json["admin_status"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "userDetail": userDetail == null ? null : userDetail!.toJson(),
    "tagsList": tagsList == null
        ? null
        : List<dynamic>.from(tagsList!.map((x) => x)),
    "itemsList": itemsList == null
        ? null
        : List<dynamic>.from(itemsList!.map((x) => x)),
    "title": title == null ? null : title,
    "location": location == null ? null : location,
    "street": street == null ? null : street,
    "province": province == null ? null : province,
    "country": country == null ?  null : country,
    "postal_code": postalCode == null ? null : postalCode,
    "date": date == null ? null : date?.toIso8601String(),
    "start_date": startDate == null ? null : startDate?.toIso8601String(),
    "end_date": endDate == null ? null : endDate?.toIso8601String(),
    "description": description == null ? null : description,
    "call_action": callAction == null ? null : callAction,
    "url_link": urlLink == null ? null : urlLink,
    "amount": amount,
    "currency": currency,
    "advViewCount": advViewCount == null ? null : advViewCount,
    "advClickCount": advClickCount == null ? null : advClickCount,
    "admin_status": adminStatus == null ? null : adminStatus,
    "isActive": isActive == null ? null : isActive,
    "status": status == null ? null : status,
  };
}

class UserDetail {
  UserDetail({
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
    this.compnayPhoneNumber,
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
  dynamic houseNumber;
  dynamic streetName;
  String? phoneNumber;
  dynamic city;
  String? country;
  dynamic idCountry;
  dynamic postalCode;
  String? mobileStatus;
  String? profileImage;
  String? role;
  String? status;
  String? onlineStatus;
  double? latitude;
  double? longitude;
  String? profession;
  String? companyName;
  String? companyPhoneNumber;
  String? compnayStreetName;
  String? compnayPhoneNumber;
  String? compnayCity;
  String? companyCountry;
  int? compnayIdCountry;
  String? compnayPostalCode;
  String? compnayWebsite;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"] == null ? null : json["id"],
    idSocial: json["id_social"] == null ? null : json["id_social"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    email: json["email"] == null ? null : json["email"],
    houseNumber: json["house_number"],
    streetName: json["street_name"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    city: json["city"],
    country: json["country"] == null ? null : json["country"],
    idCountry: json["id_country"],
    postalCode: json["postal_code"],
    mobileStatus:
    json["mobile_status"] == null ? null : json["mobile_status"],
    profileImage:
    json["profile_image"] == null ? null : json["profile_image"],
    role: json["role"] == null ? null : json["role"],
    status: json["status"] == null ? null : json["status"],
    onlineStatus:
    json["online_status"] == null ? null : json["online_status"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "id_social": idSocial == null ? null : idSocial,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "house_number": houseNumber,
    "street_name": streetName,
    "phone_number": phoneNumber == null ? null : phoneNumber,
    "city": city,
    "country": country == null ? null : country,
    "id_country": idCountry,
    "postal_code": postalCode,
    "mobile_status": mobileStatus == null ? null : mobileStatus,
    "profile_image": profileImage == null ? null : profileImage,
    "role": role == null ? null : role,
    "status": status == null ? null : status,
    "online_status": onlineStatus == null ? null : onlineStatus,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "profession": profession == null ? null : profession,
    "company_name": companyName == null ? null : companyName,
    "company_phone_number":
    companyPhoneNumber == null ? null : companyPhoneNumber,
    "compnay_street_name":
    compnayStreetName == null ? null : compnayStreetName,
    "compnay_phone_number":
    compnayPhoneNumber == null ? null : compnayPhoneNumber,
    "compnay_city": compnayCity == null ? null : compnayCity,
    "company_country": companyCountry == null ? null : companyCountry,
    "compnay_id_country":
    compnayIdCountry == null ? null : compnayIdCountry,
    "compnay_postal_code":
    compnayPostalCode == null ? null : compnayPostalCode,
    "compnay_website": compnayWebsite == null ? null : compnayWebsite,
  };
}

