import 'dart:convert';

AdInformationModel adInformationModelFromJson(String str) =>
    AdInformationModel.fromJson(json.decode(str));

String adInformationModelToJson(AdInformationModel data) =>
    json.encode(data.toJson());

class AdInformationModel {
  AdInformationModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory AdInformationModel.fromJson(Map<String, dynamic> json) =>
      AdInformationModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
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
    this.profilePhoto,
    this.basicInfo,
    this.socialMedia,
    this.aboutMe,
    this.hobbiesInterest,
    this.testimonials,
    this.visitors,
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
  List<dynamic>? userView;

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
        profileImage: json["profile_image"] ?? "",
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
        profilePhoto: json["profile_photo"],
        basicInfo: json["basic_info"],
        socialMedia: json["social_media"],
        aboutMe: json["about_me"],
        hobbiesInterest: json["hobbies_interest"],
        testimonials: json["testimonials"],
        visitors: json["visitors"],
        userView: json["userView"] == null
            ? []
            : List<dynamic>.from(json["userView"].map((x) => x)),
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
        "profile_photo": profilePhoto,
        "basic_info": basicInfo,
        "social_media": socialMedia,
        "about_me": aboutMe,
        "hobbies_interest": hobbiesInterest,
        "testimonials": testimonials,
        "visitors": visitors,
        "userView": List<dynamic>.from(userView!.map((x) => x)),
      };
}
