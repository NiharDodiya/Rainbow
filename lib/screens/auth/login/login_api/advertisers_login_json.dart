import 'dart:convert';

AdvertisersLoginModel advertisersLoginModelFromJson(String str) =>
    AdvertisersLoginModel.fromJson(json.decode(str));

String advertisersLoginModelToJson(AdvertisersLoginModel data) =>
    json.encode(data.toJson());

class AdvertisersLoginModel {
  AdvertisersLoginModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  bool? status;
  String? message;
  String? token;
  Data? data;

  factory AdvertisersLoginModel.fromJson(Map<String, dynamic> json) =>
      AdvertisersLoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "data": data!.toJson(),
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
  int? postalCode;
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
  int? compnayPostalCode;
  String? compnayWebsite;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        profileImage: json["profile_image"],
        role: json["role"],
        status: json["status"],
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

  Map<String, dynamic> toJson() => {
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
        "profile_image": profileImage,
        "role": role,
        "status": status,
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
