class AdAndPost {
  AdAndPost({
    this.id,
    this.idUser,
    this.postUser,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.postList,
    this.isLike,
    this.postLikeCount,
    this.postLikeUser,
    this.postShareCount,
    this.postTag,
    this.isView,
    this.postViewcount,
    this.postViewUser,
    this.postCommentCount,
    this.userDetails,
    this.tagsList,
    this.itemsList,
    this.location,
    this.street,
    this.province,
    this.postalCode,
    this.date,
    this.startDate,
    this.endDate,
    this.callAction,
    this.advViewCount,
    this.advClickCount,
    this.urlLink,
    this.amount,
    this.currency,
    this.adminStatus,
    this.isActive,
  });

  int? id;
  int? idUser;
  PostUser? postUser;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? postList;
  String? isLike;
  int? postLikeCount;
  List<PostLikeUser>? postLikeUser;
  int? postShareCount;
  List<PostTag>? postTag;
  String? isView;
  int? postViewcount;
  List<PostUser>? postViewUser;
  int? postCommentCount;
  UserDetails? userDetails;
  List<String>? tagsList;
  List<dynamic>? itemsList;
  String? location;
  String? street;
  String? province;
  String? postalCode;
  DateTime? date;
  DateTime? startDate;
  DateTime? endDate;
  String? callAction;
  int? advViewCount;
  int? advClickCount;
  String? urlLink;
  String? amount;
  String? currency;
  String? adminStatus;
  bool? isActive;

  factory AdAndPost.fromJson(Map<String, dynamic> json) => AdAndPost(
        id: json["id"],
        idUser: json["id_user"],
        postUser: json["post_user"] == null
            ? null
            : PostUser.fromJson(json["post_user"]),
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        postList: json["postList"] == null
            ? null
            : List<String>.from(json["postList"].map((x) => x)),
        isLike: json["isLike"],
        postLikeCount: json["postLikeCount"],
        postLikeUser: json["postLikeUser"] == null
            ? null
            : List<PostLikeUser>.from(
                json["postLikeUser"].map((x) => PostLikeUser.fromJson(x))),
        postShareCount: json["postShareCount"],
        postTag: json["postTag"] == null
            ? null
            : List<PostTag>.from(
                json["postTag"].map((x) => PostTag.fromJson(x))),
        isView: json["isView"],
        postViewcount: json["postViewcount"],
        postViewUser: json["postViewUser"] == null
            ? null
            : List<PostUser>.from(
                json["postViewUser"].map((x) => PostUser.fromJson(x))),
        postCommentCount: json["postCommentCount"],
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromJson(json["userDetails"]),
        tagsList: json["tagsList"] == null
            ? null
            : List<String>.from(json["tagsList"].map((x) => x)),
        itemsList: json["itemsList"] == null
            ? null
            : List<dynamic>.from(json["itemsList"].map((x) => x)),
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
        callAction: json["call_action"],
        advViewCount: json["advViewCount"],
        advClickCount: json["advClickCount"],
        urlLink: json["url_link"],
        amount: json["amount"],
        currency: json["currency"],
        adminStatus: json["admin_status"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "post_user": postUser == null ? null : postUser!.toJson(),
        "title": title,
        "description": description,
        "status": status,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "postList": postList == null
            ? null
            : List<dynamic>.from(postList!.map((x) => x)),
        "isLike": isLike,
        "postLikeCount": postLikeCount,
        "postLikeUser": postLikeUser == null
            ? null
            : List<dynamic>.from(postLikeUser!.map((x) => x.toJson())),
        "postShareCount": postShareCount,
        "postTag": postTag == null
            ? null
            : List<dynamic>.from(postTag!.map((x) => x.toJson())),
        "isView": isView,
        "postViewcount": postViewcount,
        "postViewUser": postViewUser == null
            ? null
            : List<dynamic>.from(postViewUser!.map((x) => x.toJson())),
        "postCommentCount": postCommentCount,
        "userDetails": userDetails == null ? null : userDetails!.toJson(),
        "tagsList": tagsList == null
            ? null
            : List<dynamic>.from(tagsList!.map((x) => x)),
        "itemsList": itemsList == null
            ? null
            : List<dynamic>.from(itemsList!.map((x) => x)),
        "location": location,
        "street": street,
        "province": province,
        "postal_code": postalCode,
        "date": date == null ? null : date!.toIso8601String(),
        "start_date": startDate == null ? null : startDate!.toIso8601String(),
        "end_date": endDate == null ? null : endDate!.toIso8601String(),
        "call_action": callAction,
        "advViewCount": advViewCount,
        "advClickCount": advClickCount,
        "url_link": urlLink,
        "amount": amount,
        "currency": currency,
        "admin_status": adminStatus,
        "isActive": isActive,
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

class PostLikeUser {
  PostLikeUser({
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

  factory PostLikeUser.fromJson(Map<String, dynamic> json) => PostLikeUser(
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
        referrallCode: json["referrall_code"],
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
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}

class PostTag {
  PostTag({
    this.idUser,
    this.name,
  });

  int? idUser;
  String? name;

  factory PostTag.fromJson(Map<String, dynamic> json) => PostTag(
        idUser: json["id_user"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "name": name,
      };
}

class PostUser {
  PostUser({
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

  factory PostUser.fromJson(Map<String, dynamic> json) => PostUser(
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
        referrallCode: json["referrall_code"],
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
                : json["latitude"],
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
        "hobbies_and_Interest": hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status,
      };
}
