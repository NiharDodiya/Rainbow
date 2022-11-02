// To parse this JSON data, do
//
//     final editAdvertisementModel = editAdvertisementModelFromJson(jsonString?);

import 'dart:convert';

EditAdvertisementModel editAdvertisementModelFromJson(String? str) => EditAdvertisementModel.fromJson(json.decode(str!));

String? editAdvertisementModelToJson(EditAdvertisementModel data) => json.encode(data.toJson());

class EditAdvertisementModel {
  EditAdvertisementModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory EditAdvertisementModel.fromJson(Map<String?, dynamic> json) => EditAdvertisementModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String?, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
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
  List<String?>? tagsList;
  List<ItemsList>? itemsList;
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
  String? amount;
  String? currency;
  int? advViewCount;
  int? advClickCount;
  String? adminStatus;
  bool? isActive;
  String? status;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
    id: json["id"],
    userDetail: UserDetail.fromJson(json["userDetail"]),
    tagsList: List<String?>.from(json["tagsList"].map((x) => x)),
    itemsList: List<ItemsList>.from(json["itemsList"].map((x) => ItemsList.fromJson(x))),
    title: json["title"],
    location: json["location"],
    street: json["street"],
    province: json["province"],
    country: json["country"],
    postalCode: json["postal_code"],
    date: DateTime.parse(json["date"]),
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    description: json["description"],
    callAction: json["call_action"],
    urlLink: json["url_link"],
    amount: json["amount"],
    currency: json["currency"],
    advViewCount: json["advViewCount"],
    advClickCount: json["advClickCount"],
    adminStatus: json["admin_status"],
    isActive: json["isActive"],
    status: json["status"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "userDetail": userDetail?.toJson(),
    "tagsList": tagsList == null
        ? null
        : List<dynamic>.from(tagsList!.map((x) => x)),
    "itemsList": itemsList == null
        ? null
        : List<dynamic>.from(itemsList!.map((x) => x.toJson())),
    "title": title,
    "location": location,
    "street": street,
    "province": province,
    "country": country,
    "postal_code": postalCode,
    "date": date?.toIso8601String(),
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "description": description,
    "call_action": callAction,
    "url_link": urlLink,
    "amount": amount,
    "currency": currency,
    "advViewCount": advViewCount,
    "advClickCount": advClickCount,
    "admin_status": adminStatus,
    "isActive": isActive,
    "status": status,
  };
}

class ItemsList {
  ItemsList({
    this.id,
    this.itemUrl,
  });

  int? id;
  String? itemUrl;

  factory ItemsList.fromJson(Map<String?, dynamic> json) => ItemsList(
    id: json["id"],
    itemUrl: json["itemUrl"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "itemUrl": itemUrl,
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
    this.idCardPrimary,
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
  int? idCardPrimary;
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

  factory UserDetail.fromJson(Map<String?, dynamic> json) => UserDetail(
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
    idCardPrimary: json["id_card_primary"],
    profileImage: json["profile_image"],
    role: json["role"],
    status: json["status"],
    onlineStatus: json["online_status"],
    latitude: json["latitude"].isEmpty
        ? null
        : json["latitude"] is String?
        ? double.parse(json["latitude"])
        : json["latitude"],
    longitude: json["longitude"].isEmpty
        ? null
        : json["longitude"] is String?
        ? double.parse(json["longitude"])
        : json["longitude"],
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
    "id_card_primary": idCardPrimary,
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


/*
import 'dart:convert';

EditAdvertisementModel editAdvertisementModelFromJson(String? str) =>
    EditAdvertisementModel.fromJson(json.decode(str));

String? editAdvertisementModelToJson(EditAdvertisementModel data) =>
    json.encode(data.toJson());

class EditAdvertisementModel {
  EditAdvertisementModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String?? message;
  Data? data;

  factory EditAdvertisementModel.fromJson(Map<String?, dynamic> json) =>
      EditAdvertisementModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
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

  int?? id;
  UserDetail? userDetail;
  List<String?>? tagsList;
  List<String?>? itemsList;
  String?? title;
  String?? location;
  String?? street;
  String?? province;
  String?? country;
  String?? postalCode;
  DateTime? date;
  DateTime? startDate;
  DateTime? endDate;
  String?? description;
  String?? callAction;
  String?? urlLink;
  dynamic amount;
  dynamic currency;
  int?? advViewCount;
  int?? advClickCount;
  String?? adminStatus;
  bool? isActive;
  String?? status;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        userDetail: json["userDetail"] == null
            ? null
            : UserDetail.fromJson(json["userDetail"]),
        tagsList: json["tagsList"] == null
            ? null
            : List<String?>.from(json["tagsList"].map((x) => x)),
        itemsList: json["itemsList"] == null
            ? null
            : List<String?>.from(json["itemsList"].map((x) => x)),
        title: json["title"],
        location: json["location"],
        street: json["street"],
        province: json["province"],
        country: json["country"],
        postalCode: json["postal_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        description: json["description"],
        callAction: json["call_action"],
        urlLink: json["url_link"],
        amount: json["amount"],
        currency: json["currency"],
        advViewCount: json["advViewCount"],
        advClickCount: json["advClickCount"],
        adminStatus: json["admin_status"],
        isActive: json["isActive"],
        status: json["status"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userDetail": userDetail == null ? null : userDetail!.toJson(),
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
        "country": country,
        "postal_code": postalCode,
        // ignore: prefer_null_aware_operators
        "date": date == null ? null : date?.toIso8601String?(),
        // ignore: prefer_null_aware_operators
        "start_date": startDate == null ? null : startDate?.toIso8601String?(),
        // ignore: prefer_null_aware_operators
        "end_date": endDate == null ? null : endDate?.toIso8601String?(),
        "description": description,
        "call_action": callAction,
        "url_link": urlLink,
        "amount": amount,
        "currency": currency,
        "advViewCount": advViewCount,
        "advClickCount": advClickCount,
        "admin_status": adminStatus,
        "isActive": isActive,
        "status": status,
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

  int?? id;
  String?? idSocial;
  String?? fullName;
  String?? email;
  dynamic houseNumber;
  dynamic streetName;
  String?? phoneNumber;
  dynamic city;
  String?? country;
  dynamic idCountry;
  dynamic postalCode;
  String?? mobileStatus;
  String?? profileImage;
  String?? role;
  String?? status;
  String?? onlineStatus;
  double? latitude;
  double? longitude;
  String?? profession;
  String?? companyName;
  String?? companyPhoneNumber;
  String?? compnayStreetName;
  String?? compnayPhoneNumber;
  String?? compnayCity;
  String?? companyCountry;
  int?? compnayIdCountry;
  String?? compnayPostalCode;
  String?? compnayWebsite;

  factory UserDetail.fromJson(Map<String?, dynamic> json) => UserDetail(
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
        latitude: json["latitude"].toString?().isEmpty
            ? null
            : json["latitude"] is String?
                ? double.parse(json["latitude"])
                : json["latitude"],
        longitude: json["longitude"].toString?().isEmpty
            ? null
            : json["longitude"] is String?
                ? double.parse(json["longitude"])
                : json["longitude"],
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
        "compnay_phone_number": compnayPhoneNumber,
        "compnay_city": compnayCity,
        "company_country": companyCountry,
        "compnay_id_country": compnayIdCountry,
        "compnay_postal_code": compnayPostalCode,
        "compnay_website": compnayWebsite,
      };
}
*/
