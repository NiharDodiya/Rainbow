/*
// To parse this JSON data, do
//
//     final friendPostViewModel = friendPostViewModelFromJson(jsonString);

import 'dart:convert';



String? friendPostViewModelToJson(FriendPostViewModel data) =>
    json.encode(data.toJson());

class FriendPostViewModel {
  FriendPostViewModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory FriendPostViewModel.fromJson(Map<String, dynamic> json) =>
      FriendPostViewModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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
  List<PostUser>? postLikeUser;
  int? postShareCount;
  List<dynamic>? postTag;
  String? isView;
  int? postViewcount;
  List<dynamic>? postViewUser;
  int? postCommentCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
            : List<PostUser>.from(
                json["postLikeUser"].map((x) => PostUser.fromJson(x))),
        postShareCount:
            json["postShareCount"] == null ? null : json["postShareCount"],
        postTag: json["postTag"] == null
            ? null
            : List<dynamic>.from(json["postTag"].map((x) => x)),
        isView: json["isView"] == null ? null : json["isView"],
        postViewcount:
            json["postViewcount"] == null ? null : json["postViewcount"],
        postViewUser: json["postViewUser"] == null
            ? null
            : List<dynamic>.from(json["postViewUser"].map((x) => x)),
        postCommentCount:
            json["postCommentCount"] == null ? null : json["postCommentCount"],
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
        "postTag":
            postTag == null ? null : List<dynamic>.from(postTag!.map((x) => x)),
        "isView": isView == null ? null : isView,
        "postViewcount": postViewcount == null ? null : postViewcount,
        "postViewUser": postViewUser == null
            ? null
            : List<dynamic>.from(postViewUser!.map((x) => x)),
        "postCommentCount": postCommentCount == null ? null : postCommentCount,
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
    this.idEthnicity,
    this.birthDate,
    this.noKids,
    this.mobileStatus,
    this.role,
    this.idStatus,
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
    this.hobbiesAndinterest,
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
  String? idEthnicity;
  DateTime? birthDate;
  int? noKids;
  String? mobileStatus;
  String? role;
  String? idStatus;
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
  String? hobbiesAndinterest;
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
        idEthnicity: json["id_ethnicity"] == null ? null : json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"] == null ? null : json["no_kids"],
        mobileStatus:
            json["mobile_status"] == null ? null : json["mobile_status"],
        role: json["role"] == null ? null : json["role"],
        idStatus: json["id_status"] == null ? null : json["id_status"],
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
        hobbiesAndinterest: json["hobbies_and_interest"] == null
            ? null
            : json["hobbies_and_interest"],
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
        "id_ethnicity": idEthnicity == null ? null : idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids == null ? null : noKids,
        "mobile_status": mobileStatus == null ? null : mobileStatus,
        "role": role == null ? null : role,
        "id_status": idStatus == null ? null : idStatus,
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
        "hobbies_and_int?erest":
            hobbiesAndinterest == null ? null : hobbiesAndinterest,
        "background_image": backgroundImage == null ? null : backgroundImage,
        "profile_image": profileImage == null ? null : profileImage,
        "status": status == null ? null : status,
      };
}

*/

// To parse this JSON data, do
//
//     final friendPostViewModel = friendPostViewModelFromJson(jsonString);

import 'dart:convert';

FriendPostViewModel friendPostViewModelFromJson(String? str) =>
    FriendPostViewModel.fromJson(json.decode(str!));

String? friendPostViewModelToJson(FriendPostViewModel data) =>
    json.encode(data.toJson());

class FriendPostViewModel {
  FriendPostViewModel({
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
  List<FriendPost>? data;

  factory FriendPostViewModel.fromJson(Map<String, dynamic> json) =>
      FriendPostViewModel(
        status: json["status"],
        message: json["message"],
        cuurentPage: json["cuurentPage"],
        totalPage: json["totalPage"],
        count: json["count"],
        data: json["data"] == null
            ? null
            : List<FriendPost>.from(
                json["data"].map((x) => FriendPost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cuurentPage": cuurentPage,
        "totalPage": totalPage,
        "count": count,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FriendPost {
  FriendPost({
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

  factory FriendPost.fromJson(Map<String, dynamic> json) => FriendPost(
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
