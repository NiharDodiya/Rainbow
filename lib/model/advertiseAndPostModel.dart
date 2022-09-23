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
    id: json["id"] == null ? null : json["id"],
    idUser: json["id_user"] == null ? null : json["id_user"],
    postUser: json["post_user"] == null
        ? null
        : PostUser.fromJson(json["post_user"]),
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    postList: json["postList"] == null
        ? null
        : List<String>.from(json["postList"].map((x) => x)),
    isLike: json["isLike"] == null ? null : json["isLike"],
    postLikeCount:
    json["postLikeCount"] == null ? null : json["postLikeCount"],
    postLikeUser: json["postLikeUser"] == null
        ? null
        : List<PostLikeUser>.from(
        json["postLikeUser"].map((x) => PostLikeUser.fromJson(x))),
    postShareCount:
    json["postShareCount"] == null ? null : json["postShareCount"],
    postTag: json["postTag"] == null
        ? null
        : List<PostTag>.from(
        json["postTag"].map((x) => PostTag.fromJson(x))),
    isView: json["isView"] == null ? null : json["isView"],
    postViewcount:
    json["postViewcount"] == null ? null : json["postViewcount"],
    postViewUser: json["postViewUser"] == null
        ? null
        : List<PostUser>.from(
        json["postViewUser"].map((x) => PostUser.fromJson(x))),
    postCommentCount:
    json["postCommentCount"] == null ? null : json["postCommentCount"],

    userDetails: json["userDetails"] == null ? null : UserDetails.fromJson(json["userDetails"]),
    tagsList: json["tagsList"] == null ? null : List<String>.from(json["tagsList"].map((x) => x)),
    itemsList: json["itemsList"] == null ? null : List<dynamic>.from(json["itemsList"].map((x) => x)),
    location: json["location"] == null ? null : json["location"],
    street: json["street"] == null ? null : json["street"],
    province: json["province"] == null ? null : json["province"],
    postalCode: json["postal_code"] == null ? null : json["postal_code"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    callAction: json["call_action"] == null ? null : json["call_action"],
    advViewCount: json["advViewCount"] == null ? null : json["advViewCount"],
    advClickCount: json["advClickCount"] == null ? null : json["advClickCount"],
    urlLink: json["url_link"] == null ? null : json["url_link"],
    amount: json["amount"] == null ? null : json["amount"],
    currency: json["currency"] == null ? null : json["currency"],
    adminStatus: json["admin_status"] == null ? null : json["admin_status"],
    isActive: json["isActive"] == null ? null : json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "id_user": idUser == null ? null : idUser,
    "post_user": postUser == null ? null : postUser!.toJson(),
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "postList": postList == null
        ? null
        : List<dynamic>.from(postList!.map((x) => x)),
    "isLike": isLike == null ? null : isLike,
    "postLikeCount": postLikeCount == null ? null : postLikeCount,
    "postLikeUser": postLikeUser == null
        ? null
        : List<dynamic>.from(postLikeUser!.map((x) => x.toJson())),
    "postShareCount": postShareCount == null ? null : postShareCount,
    "postTag": postTag == null
        ? null
        : List<dynamic>.from(postTag!.map((x) => x.toJson())),
    "isView": isView == null ? null : isView,
    "postViewcount": postViewcount == null ? null : postViewcount,
    "postViewUser": postViewUser == null
        ? null
        : List<dynamic>.from(postViewUser!.map((x) => x.toJson())),
    "postCommentCount": postCommentCount == null ? null : postCommentCount,
    "userDetails": userDetails == null ? null : userDetails!.toJson(),
    "tagsList": tagsList == null ? null : List<dynamic>.from(tagsList!.map((x) => x)),
    "itemsList": itemsList == null ? null : List<dynamic>.from(itemsList!.map((x) => x)),
    "location": location == null ? null : location,
    "street": street == null ? null : street,
    "province": province == null ? null : province,
    "postal_code": postalCode == null ? null : postalCode,
    "date": date == null ? null : date!.toIso8601String(),
    "start_date": startDate == null ? null : startDate!.toIso8601String(),
    "end_date": endDate == null ? null : endDate!.toIso8601String(),
    "call_action": callAction == null ? null : callAction,
    "advViewCount": advViewCount == null ? null : advViewCount,
    "advClickCount": advClickCount == null ? null : advClickCount,
    "url_link": urlLink == null ? null : urlLink,
    "amount": amount == null ? null : amount,
    "currency": currency == null ? null : currency,
    "admin_status": adminStatus == null ? null : adminStatus,
    "isActive": isActive == null ? null : isActive,
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
        : json["longitude"],
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
    idUser: json["id_user"] == null ? null : json["id_user"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "name": name == null ? null : name,
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
  };
}