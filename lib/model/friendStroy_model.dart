import 'dart:convert';

FriendStoryModel friendStoryModelFromJson(String? str) =>
    FriendStoryModel.fromJson(json.decode(str!));

String? friendStoryModelToJson(FriendStoryModel data) =>
    json.encode(data.toJson());

class FriendStoryModel {
  FriendStoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<FriendStory>? data;

  factory FriendStoryModel.fromJson(Map<String, dynamic> json) =>
      FriendStoryModel(
        status: json["status"],
        message: json["message"],
        data: List<FriendStory>.from(
            json["data"].map((x) => FriendStory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FriendStory {
  FriendStory({
    this.userDetail,
    this.storyList,
  });

  UserDetail? userDetail;
  List<StoryList>? storyList;

  factory FriendStory.fromJson(Map<String, dynamic> json) => FriendStory(
        userDetail: UserDetail.fromJson(json["userDetail"]),
        storyList: List<StoryList>.from(
            json["storyList"].map((x) => StoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userDetail": userDetail!.toJson(),
        "storyList": List<dynamic>.from(storyList!.map((x) => x.toJson())),
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
    this.storyCommentList,
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
  List<UserDetail>? storyLikeList;
  String? isLike;
  int? storyCommentCount;
  List<StoryCommentList>? storyCommentList;
  int? storyViewCount;
  List<dynamic>? storyView;
  String? isView;

  factory StoryList.fromJson(Map<String, dynamic> json) => StoryList(
        id: json["id"],
        storyItem: json["story_item"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:json["createdAt"] == null ? null :  DateTime.parse(json["updatedAt"]),
        storyTag: List<dynamic>.from(json["storyTag"].map((x) => x)),
        storyLikeCount: json["storyLikeCount"],
        storyLikeList: List<UserDetail>.from(json["storyLikeList"].map((x) => UserDetail.fromJson(x))),
        isLike: json["isLike"],
        storyCommentCount: json["storyCommentCount"],
        storyCommentList: List<StoryCommentList>.from(
            json["storyCommentList"].map((x) => StoryCommentList.fromJson(x))),
        storyViewCount: json["storyViewCount"],
        storyView: List<dynamic>.from(json["storyView"].map((x) => x)),
        isView: json["isView"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "story_item": storyItem,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "storyTag": List<dynamic>.from(storyTag!.map((x) => x)),
        "storyLikeCount": storyLikeCount,
        "storyLikeList": List<dynamic>.from(storyLikeList!.map((x) => x.toJson())),
        "isLike": isLike,
        "storyCommentCount": storyCommentCount,
        "storyCommentList":
            List<dynamic>.from(storyCommentList!.map((x) => x.toJson())),
        "storyViewCount": storyViewCount,
        "storyView": List<dynamic>.from(storyView!.map((x) => x)),
        "isView": isView,
      };
}

class StoryCommentList {
  StoryCommentList({
    this.id,
    this.description,
    this.storyUserComment,
  });

  int? id;
  String? description;
  UserDetail? storyUserComment;

  factory StoryCommentList.fromJson(Map<String, dynamic> json) =>
      StoryCommentList(
        id: json["id"],
        description: json["description"],
        storyUserComment: UserDetail.fromJson(json["storyUserComment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "storyUserComment": storyUserComment!.toJson(),
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

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        idSocial: json["id_social"],
        fullName:json["full_name"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        phoneNumber: json["phone_number"],
        maritalStatus: json["marital_status"],
        idEthnicity: json["id_ethnicity"],
        birthDate:json["birth_date"] == null ? null :  DateTime.parse(json["birth_date"]),
        noKids: json["no_kids"],
        mobileStatus: json["mobile_status"],
        role: json["role"],
        idStatus:json["id_status"],
        selfiStatus: json["selfi_status"],
        userStatus: json["user_status"],
        age: json["age"],
        city:json["city"],
        height: json["height"],
        weight: json["weight"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        about:json["about"],
        hobbiesAndInterest:
            json["hobbies_and_Interest"],
        backgroundImage: json["background_image"],
        profileImage: json["profile_image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_social": idSocial,
        "full_name": fullName,
        "email": email,
        "address1":address1,
        "address2": address2,
        "phone_number": phoneNumber,
        "marital_status":maritalStatus,
        "id_ethnicity": idEthnicity,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "no_kids": noKids,
        "mobile_status": mobileStatus,
        "role":role,
        "id_status": idStatus,
        "selfi_status": selfiStatus,
        "user_status":userStatus,
        "age": age,
        "city": city,
        "height": height,
        "weight":weight,
        "instagram": instagram,
        "youtube": youtube,
        "facebook": facebook,
        "twitter": twitter,
        "about":about,
        "hobbies_and_Interest":
        hobbiesAndInterest,
        "background_image": backgroundImage,
        "profile_image": profileImage,
        "status": status
      };
}

