// To parse this JSON data, do
//
//     final friendStoryModel = friendStoryModelFromJson(jsonString);

import 'dart:convert';

FriendStoryModel friendStoryModelFromJson(String str) => FriendStoryModel.fromJson(json.decode(str));

String friendStoryModelToJson(FriendStoryModel data) => json.encode(data.toJson());

class FriendStoryModel {
  FriendStoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory FriendStoryModel.fromJson(Map<String, dynamic> json) => FriendStoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.userDetail,
    this.storyList,
  });

  UserDetail? userDetail;
  List<StoryList>? storyList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userDetail: json["userDetail"] == null ? null : UserDetail.fromJson(json["userDetail"]),
    storyList: json["storyList"] == null ? null : List<StoryList>.from(json["storyList"].map((x) => StoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userDetail": userDetail == null ? null : userDetail!.toJson(),
    "storyList": storyList == null ? null : List<dynamic>.from(storyList!.map((x) => x.toJson())),
  };
}

class StoryList {
  StoryList({
    this.id,
    this.storyItem,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.storyTag,
    this.storyLikeCount,
    this.storyLikeList,
    this.isLike,
    this.storyCommentCount,
    this.storyComment,
    this.storyViewCount,
    this.storyView,
    this.isView,
  });

  int? id;
  String? storyItem;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? storyTag;
  int? storyLikeCount;
  List<dynamic>? storyLikeList;
  String? isLike;
  int? storyCommentCount;
  List<StoryComment>? storyComment;
  int? storyViewCount;
  List<dynamic>? storyView;
  String? isView;

  factory StoryList.fromJson(Map<String, dynamic> json) => StoryList(
    id: json["id"],
    storyItem: json["story_item"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    storyTag: json["storyTag"] == null ? null : List<dynamic>.from(json["storyTag"].map((x) => x)),
    storyLikeCount: json["storyLikeCount"],
    storyLikeList: json["storyLikeList"] == null ? null : List<dynamic>.from(json["storyLikeList"].map((x) => x)),
    isLike: json["isLike"],
    storyCommentCount: json["storyCommentCount"],
    storyComment: json["storyComment"] == null ? null : List<StoryComment>.from(json["storyComment"].map((x) => StoryComment.fromJson(x))),
    storyViewCount: json["storyViewCount"],
    storyView: json["storyView"] == null ? null : List<dynamic>.from(json["storyView"].map((x) => x)),
    isView: json["isView"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "story_item": storyItem,
    "description": description,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "storyTag": storyTag == null ? null : List<dynamic>.from(storyTag!.map((x) => x)),
    "storyLikeCount": storyLikeCount,
    "storyLikeList": storyLikeList == null ? null : List<dynamic>.from(storyLikeList!.map((x) => x)),
    "isLike": isLike,
    "storyCommentCount": storyCommentCount,
    "storyComment": storyComment == null ? null : List<dynamic>.from(storyComment!.map((x) => x.toJson())),
    "storyViewCount": storyViewCount,
    "storyView": storyView == null ? null : List<dynamic>.from(storyView!.map((x) => x)),
    "isView": isView,
  };
}

class StoryComment {
  StoryComment({
    this.id,
    this.idUser,
    this.description,
  });

  int? id;
  int? idUser;
  String? description;

  factory StoryComment.fromJson(Map<String, dynamic> json) => StoryComment(
    id: json["id"],
    idUser: json["id_user"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "description": description,
  };
}

class UserDetail {
  UserDetail({
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

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    idSocial: json["id_social"],
    fullName: json["full_name"],
    email: json["email"],
    address1: json["address1"],
    address2: json["address2"],
    phoneNumber: json["phone_number"],
    maritalStatus: json["marital_status"],
    idEthnicity: json["id_ethnicity"],
    birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
    noKids: json["no_kids"],
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
    "birth_date": birthDate == null ? null : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
    "no_kids": noKids,
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
