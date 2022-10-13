// To parse this JSON data, do
//
//     final myPostListModel = myPostListModelFromJson(jsonString);

import 'dart:convert';

MyPostListModel myPostListModelFromJson(String? str) =>
    MyPostListModel.fromJson(json.decode(str!));

String? myPostListModelToJson(MyPostListModel data) =>
    json.encode(data.toJson());

class MyPostListModel {
  MyPostListModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory MyPostListModel.fromJson(Map<String, dynamic> json) =>
      MyPostListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
  PostViewUser? postUser;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? postList;
  String? isLike;
  int? postLikeCount;
  List<dynamic>? postLikeUser;
  int? postShareCount;
  List<PostTag>? postTag;
  String? isView;
  int? postViewcount;
  List<dynamic>? postViewUser;
  int? postCommentCount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idUser: json["id_user"],
        postUser: json["post_user"] == null
            ? null
            : PostViewUser.fromJson(json["post_user"]),
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
            : List<dynamic>.from(json["postLikeUser"].map((x) => x)),
        postShareCount: json["postShareCount"],
        postTag: json["postTag"] == null
            ? null
            : List<PostTag>.from(
                json["postTag"].map((x) => PostTag.fromJson(x))),
        isView: json["isView"],
        postViewcount: json["postViewcount"],
        postViewUser: json["postViewUser"] == null
            ? null
            : List<dynamic>.from(json["postViewUser"].map((x) => x)),
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
            : List<dynamic>.from(postLikeUser!.map((x) => x)),
        "postShareCount": postShareCount,
        "postTag": postTag == null
            ? null
            : List<dynamic>.from(postTag!.map((x) => x.toJson())),
        "isView": isView,
        "postViewcount": postViewcount,
        "postViewUser": postViewUser == null
            ? null
            : List<dynamic>.from(postViewUser!.map((x) => x)),
        "postCommentCount": postCommentCount,
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

class PostViewUser {
  PostViewUser({
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
  String? hobbiesAndInterest;
  String? backgroundImage;
  String? profileImage;
  String? status;

  factory PostViewUser.fromJson(Map<String, dynamic> json) => PostViewUser(
        id: json["id"],
        idSocial: json["id_social"],
        fullName: json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus: json["mobile_status"],
        role: json["role"],
        idStatus: json["id_status"],
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
        "id_ethnicity": idEthnicity,
        "birth_date": birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "mobile_status": mobileStatus,
        "role": role,
        "id_status": idStatus,
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
